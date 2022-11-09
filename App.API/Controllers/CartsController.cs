using App.API.Infrastructure.Utilities.Constants;
using App.API.Infrastructure.ViewModels.Catalog.Carts;
using App.API.Infrastructure.ViewModels.Catalog.Color;
using App.API.Infrastructure.ViewModels.Catalog.Oders;
using App.API.Infrastructure.ViewModels.System.Users;
using App.API.Services.Catalog.Carts;
using App.API.Services.Catalog.Colors;
using App.API.Services.Catalog.Oders;
using App.API.Services.Catalog.ProductVariations;
using Data.DbContext;
using Data.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using static App.API.Infrastructure.Utilities.Constants.SystemConstants;

namespace App.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CartsController : ControllerBase
    {
        private readonly ICartServie _cartService;
        private readonly IOderService _oderService;
        private readonly QLBHContext _context;
        public CartsController(ICartServie cartService, QLBHContext context, IOderService oderService)
        {
            _cartService = cartService;
            _context = context;
            _oderService = oderService;
        }

        [HttpGet("{userId}")]
        public async Task<IActionResult> GetByUser(Guid userId)
        {
            var cartdetails = await _cartService.GetByUser(userId);
            var carts = (from a in cartdetails
                         join b in _context.ProductVariations on a.ProductVariationId equals b.Id
                         join c in _context.Colors on b.ColorId equals c.Id
                         join d in _context.Sizes on b.SizeId equals d.Id
                         join e in _context.ProductTranslations on b.ProductId equals e.ProductId
                         where e.LanguageId == "vi"
                         join f in _context.Products on b.ProductId equals f.Id
                         select new CartItemViewModel()
                         {
                             CartId = a.Id,
                             ColorId = c.Id,
                             ColorName = c.Name,
                             SizeCode = d.Code,
                             SizeId = d.Id,
                             Quantity = a.Quantity,
                             Name = e.Name,
                             Description = e.Description,
                             Image = ProductConstants.NA,
                             Price = f.Price,
                             ProductId = f.Id,
                             PVId = b.Id,
                             DateCreated = a.DateCreated
                         }).ToList();
            if (carts == null)
                return BadRequest("Cannot find cart!");
            return Ok(carts);
        }


        [HttpPost]
        public async Task<IActionResult> AddToCart(AddToCartRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var pv = await _context.ProductVariations.FirstOrDefaultAsync(c => request.ProductId == c.ProductId && c.SizeId == request.SizeId && c.ColorId == request.ColorId);
            var cart = await _context.Carts.FirstOrDefaultAsync(c=>c.ProductVariationId==pv.Id && c.UserId==request.UserId);
            if (cart != null)
            {
                cart.Quantity++;
                await _cartService.UpdateCart(cart);
                return Ok();
            } 
            var cartId = await _cartService.AddToCart(new ()
            {
                ProductVariationId = pv.Id,
                Price = request.Price,
                DateCreated = DateTime.Now,
                Quantity = request.Stock,
                UserId = (Guid)request.UserId,
            });
            if (cartId == 0)
                return BadRequest();
            return Ok();
        }

        [HttpPut]
        public async Task<IActionResult> Update(UpdateCartRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var cart = await _context.Carts.FirstOrDefaultAsync(c => c.Id == request.Id);
            if (request.Quantity == 0)
            {
                _context.Carts.Remove(cart);
                return Ok(await _context.SaveChangesAsync()>1);
            }
            cart.ProductVariationId = request.ProductVariationId;
            cart.Quantity = request.Quantity;
            cart.Price = request.Price;
            var affectedResult = await _cartService.UpdateCart(cart);
            if (affectedResult == 0)
                return BadRequest();
            return Ok();
        }

        [HttpPost("delete-cart")]
        public async Task<IActionResult> Delete(Guid userId)
        {
            var affectedResult = await _cartService.DeleteById(userId);
            if (!affectedResult)
                return BadRequest();
            return Ok();
        }
      
        [HttpPost("check-out")]
        public async Task<IActionResult> CheckOutOder(CreateOderReqquest request)
        {
            var affectedResult = await _oderService.Create(request);
            if (affectedResult == null)
            {
                return BadRequest();
            }
            return Ok();
        }
        [HttpPost("AsyncCart")]
        [Authorize]
        public async Task<IActionResult> AsyncCart(List<CartItemViewModel> request) // When Logging add session cart to user cart
        {
            var Id = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.NameIdentifier).Value;
            var carts = request.Select(c => new Cart { DateCreated = (DateTime)c.DateCreated, Price = c.Price, ProductVariationId = (int)c.PVId, Quantity = c.Quantity, UserId = Guid.Parse(Id) }).ToList();
            var affectedResult = await _cartService.AsyncOnLogin(carts);
            if (!affectedResult)
                return BadRequest();
            return Ok();
        }
    }
}
