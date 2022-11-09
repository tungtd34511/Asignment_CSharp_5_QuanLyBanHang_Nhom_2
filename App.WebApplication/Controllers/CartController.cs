using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App.API.Infrastructure.Utilities.Constants;
using App.API.Infrastructure.ViewModels.Catalog.Carts;
using App.API.Infrastructure.ViewModels.Sales;
using App.API.Infrastructure.ViewModels.System.Languages;
using App.WebApplication.IServices;
using App.WebApplication.Models;
using Data.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Identity;
using System.Security.Claims;
using App.API.Services.Catalog.Carts;
using App.API.Infrastructure.ViewModels.Catalog.Oders;
using App.WebApplication.Services;

namespace App.WebApplication.Controllers
{
    public class CartController : Controller
    {
        private readonly IProductApiClient _productApiClient;
        private readonly IColorApiClient _colorApiClient;
        private readonly ISizeApiClient _sizeApiClient;
        private readonly ICartApiClient _cartApiClient;
        public CartController(IProductApiClient productApiClient, IColorApiClient colorApiClient, ISizeApiClient sizeApiClient, IProductVariationApiClient productVariationApiClient, ICartApiClient cartApiClient)
        {
            _productApiClient = productApiClient;
            _colorApiClient = colorApiClient;
            _sizeApiClient = sizeApiClient;
            _cartApiClient = cartApiClient;
        }

        public async Task<IActionResult> Index()
        {
            List<CartItemViewModel> currentCart = new List<CartItemViewModel>();
            if (User.Identity.IsAuthenticated)
            {
                var Id = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.NameIdentifier).Value;
                currentCart = await _cartApiClient.GetByUser(Id);
                return View(currentCart);
            }
            var session = HttpContext.Session.GetString(SystemConstants.CartSession);
            if (session != null)
                currentCart = JsonConvert.DeserializeObject<List<CartItemViewModel>>(session);
            return View(currentCart);
        }

        [HttpGet]
        public async Task<IActionResult> Checkout()
        {
            return View(await GetCheckoutViewModel());
        }
        public IActionResult CheckoutSucess()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Checkout([FromForm]CheckoutRequest request) // Forrmform tự động binding dữ liệu từ form
        {
            string Id;
            List<CartItemViewModel> currentCart = new List<CartItemViewModel>();
            if (User.Identity.IsAuthenticated)
            {
                Id = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.NameIdentifier).Value;
                currentCart = await _cartApiClient.GetByUser(Id);
            }
            else
            {
                var session = HttpContext.Session.GetString(SystemConstants.CartSession);
                if (session != null)
                    currentCart = JsonConvert.DeserializeObject<List<CartItemViewModel>>(session);
            }
            var Oderdetails = currentCart.Select(c => new OrderDetail()
            {
                Price = c.Price,
                ProductVariationId = (int)c.PVId,
                Quantity = c.Quantity
            }).ToList();
            //
            var checkoutRequest = new CreateOderReqquest()
            {
                OrderDate = DateTime.Now,
                ShipAddress = request.ShipAddress,
                ShipEmail = request.ShipName,
                ShipName = request.ShipName,
                Status = Data.Enums.OrderStatus.Success,
                ShipPhoneNumber = request.ShipPhoneNumber,
                OrderDetails = Oderdetails
            };
            if (User.Identity.IsAuthenticated)
            {
                checkoutRequest.UserId = Guid.Parse(User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.NameIdentifier).Value);
            }
            checkoutRequest.LastName = request.LastName;
            checkoutRequest.FirstName = request.FirstName;
          
            //TODO: Add to API
            var result = await _cartApiClient.Checkout(checkoutRequest);
            if (result)
                return RedirectToAction("CheckoutSucess");
            return View(new CheckoutViewModel() { CartItems = currentCart,CheckoutModel = request});
        }

        [HttpGet]
        public async Task<IActionResult> GetListItems()
        {
            List<CartItemViewModel> currentCart = new List<CartItemViewModel>();
            if (User.Identity.IsAuthenticated)
            {
                var Id = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.NameIdentifier).Value;
                currentCart = await _cartApiClient.GetByUser(Id);
                return Ok(currentCart);
            }
            var session = HttpContext.Session.GetString(SystemConstants.CartSession);
            if (session != null)
                currentCart = JsonConvert.DeserializeObject<List<CartItemViewModel>>(session);
            return Ok(currentCart);
        }

        [HttpPost] // id1: Product, id2: Color, id3: Size
        public async Task<IActionResult> AddToCart(int id1, int id2,int id3, string languageId="vi")
        {
            var product = await _productApiClient.GetById(id1, languageId);
            List<CartItemViewModel> currentCart = new List<CartItemViewModel>();
            if (User.Identity.IsAuthenticated)
            {
                var Id = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.NameIdentifier).Value;
                await _cartApiClient.AddToCart(new AddToCartRequest()
                {
                    SizeId = id3,
                    Stock = 1,
                    ColorId = id2,
                    Price = product.Price,
                    ProductId = product.Id,
                    UserId = Guid.Parse(Id)
                });
                return Ok(currentCart);
            }
            var session = HttpContext.Session.GetString(SystemConstants.CartSession);
            
            if (session != null)
                currentCart = JsonConvert.DeserializeObject<List<CartItemViewModel>>(session);

            int quantity = 1;
            if (currentCart.Any(x => x.ProductId == id1&&x.ColorId==id2&&x.SizeId==id3))
            {
                currentCart.First(x => x.ProductId == id1 && x.ColorId == id2 && x.SizeId == id3).Quantity ++;
            }
            else {  
                var color = await _colorApiClient.GetById(languageId, id2);
                var size = await _sizeApiClient.GetById(languageId, id3);
                var cartItem = new CartItemViewModel()
                {
                    ProductId = id1,
                    ColorId = id2,
                    SizeId = id3,
                    ColorName = color.Name,
                    SizeCode = size.Code,
                    Description = product.Description,
                    Image = product.ThumbnailImage,
                    Name = product.Name,
                    Price = product.Price,
                    Quantity = quantity,
                    PVId = product.ProductVariationVms.FirstOrDefault(c=>c.ColorId==id2&&c.SizeId==id3).Id,
                    DateCreated = DateTime.Now
                };
                currentCart.Add(cartItem);
            }
            HttpContext.Session.SetString(SystemConstants.CartSession, JsonConvert.SerializeObject(currentCart));
            return Ok(currentCart);
        }
        [HttpGet]
        public async Task<IActionResult> GetQuantity()
        {
            List<CartItemViewModel> currentCart = new List<CartItemViewModel>();
            var count = 0;
            if (User.Identity.IsAuthenticated)
            {
                var Id = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.NameIdentifier).Value;
                currentCart =  await _cartApiClient.GetByUser(Id);
                foreach(var item in currentCart)
                {
                    count+=item.Quantity;
                }
                return Ok(count);
            }
            var session = HttpContext.Session.GetString(SystemConstants.CartSession);
            
            if (session != null)
                currentCart = JsonConvert.DeserializeObject<List<CartItemViewModel>>(session);
            
            foreach(var item in currentCart)
            {
                count += item.Quantity;
            }
            return Ok(count);
        }
       
        [HttpPost]  // id1: Product, id2: Color, id3: Size
        public async Task<IActionResult> UpdateCart(int id1, int id2, int id3, int quantity)
        {
            List<CartItemViewModel> currentCart = new List<CartItemViewModel>();
            if (User.Identity.IsAuthenticated)
            {
                var Id = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.NameIdentifier).Value;
                var product = await _productApiClient.GetById(id1, "vi");
                var carts = await _cartApiClient.GetByUser(Id);
                var pvId = product.ProductVariationVms.FirstOrDefault(c => c.ProductId == id1 && c.ColorId == id2 && c.SizeId == id3).Id;
                var cart = carts.FirstOrDefault(c => c.ProductId == id1 && c.ColorId == id2 && c.SizeId == id3);
                var result =  await _cartApiClient.Update(new UpdateCartRequest()
                {
                    DateCreated = (DateTime)cart.DateCreated,
                    ProductVariationId = pvId,
                    Id = (int)cart.CartId,
                    Quantity = quantity,
                    Price = product.Price,
                    UserId = Guid.Parse(Id)
                });
                if (result)
                {
                    return Ok();
                }
                return BadRequest();
            }
            var session = HttpContext.Session.GetString(SystemConstants.CartSession);
            if (session != null)
                currentCart = JsonConvert.DeserializeObject<List<CartItemViewModel>>(session);

            foreach (var item in currentCart)
            {
                if (item.ProductId == id1 && item.ColorId==id2&&item.SizeId==id3)
                {
                    if (quantity == 0)
                    {
                        currentCart.Remove(item);
                        break;
                    }
                    item.Quantity = quantity;
                }
            }
            HttpContext.Session.SetString(SystemConstants.CartSession, JsonConvert.SerializeObject(currentCart));
            return Ok(currentCart);
        }

        private async Task<CheckoutViewModel> GetCheckoutViewModel()
        {
            List<CartItemViewModel> currentCart = new List<CartItemViewModel>();
            CheckoutViewModel checkoutVm = new CheckoutViewModel();
            if (User.Identity.IsAuthenticated)
            {
                var Id = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.NameIdentifier).Value;
                currentCart = await _cartApiClient.GetByUser(Id);
                checkoutVm.CartItems = currentCart;
                checkoutVm.CheckoutModel = new CheckoutRequest()
                {
                    UserId = Guid.Parse(Id),
                    LastName = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.UserData).Value,
                    FirstName = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.GivenName).Value
                };
                return checkoutVm;
            }
            var session = HttpContext.Session.GetString(SystemConstants.CartSession);
            
            if (session != null)
                currentCart = JsonConvert.DeserializeObject<List<CartItemViewModel>>(session);
            checkoutVm.CartItems = currentCart;
            checkoutVm.CheckoutModel = new CheckoutRequest();
            return checkoutVm;
        }
    }
}