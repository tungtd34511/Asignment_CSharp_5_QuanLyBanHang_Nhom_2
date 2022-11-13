using App.API.Infrastructure.ViewModels.Catalog.Color;
using App.API.Infrastructure.ViewModels.Catalog.ProductImages;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.Catalog.ProductVariations;
using App.API.Services.Catalog.Colors;
using App.API.Services.Catalog.Products;
using App.API.Services.Catalog.ProductVariations;
using Data.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Drawing;
using Size = Data.Entities.Size;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace App.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductVariationsController : ControllerBase
    {
        private readonly IProductVariationService _productVariationService;

        public ProductVariationsController(IProductVariationService productVariationService)
        {
            _productVariationService = productVariationService;
        }
        [HttpGet("paging")]
        public async Task<IActionResult> GetAllPaging([FromQuery] GetManageProductVariationPagingRequest request)
        {
            var products = await _productVariationService.GetAllPaging(request);
            return Ok(products);
        }

        [HttpGet("{id}/{languageId}")]
        public async Task<IActionResult> GetById(int id, string languageId = "vi")
        {
            var product = await _productVariationService.GetById(id);
            if (product == null)
                return BadRequest("Cannot find ProductVariation!");
            return Ok(product);
        }


        [HttpPost]
        [Consumes("multipart/form-data")]
        [Authorize]
        public async Task<IActionResult> Create([FromForm] CreateProductVariationRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var pv = new ProductVariation()
            {
                ProductId = request.ProductId,
                SizeId = request.SizeId,
                ColorId = request.ColorId,
                Stock = request.StocK
            };
            var productId = await _productVariationService.Create(pv);
            if (productId == 0)
                return BadRequest();

            var product = await _productVariationService.GetById(productId);

            return Ok();
        }

        [HttpPut()]
        [Consumes("multipart/form-data")]
        public async Task<IActionResult> Update([FromForm] UpdateProductVariationRequest request)
        {
            var pv = new ProductVariation()
            {
                Id = request.ProductId,
                ProductId = request.ProductId,
                SizeId = request.SizeId,
                ColorId = request.ColorId,
                Stock = request.Stock
            };
            var affectedResult =  await _productVariationService.Update(pv);
            if (affectedResult==0)
                return BadRequest();
            return Ok();
        }
    }
}
