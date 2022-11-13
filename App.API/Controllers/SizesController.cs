using App.API.Infrastructure.ViewModels.Catalog.ProductImages;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.Catalog.Size;
using App.API.Services.Catalog.Products;
using App.API.Services.Catalog.Sizes;
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
    public class SizesController : ControllerBase
    {
        private readonly ISizeService _sizeService;

        public SizesController(ISizeService  sizeService)
        {
            _sizeService = sizeService;
        }

        [HttpGet("paging")]
        public async Task<IActionResult> GetAllPaging([FromQuery] GetManageSizePagingRequest request)
        {
            var products = await _sizeService.GetAllPaging(request);
            return Ok(products);
        }
        [HttpGet]
        public async Task<IActionResult> GetAll(string languageId)
        {
            var products = await _sizeService.GetAll();
            return Ok(products);
        }
        [HttpGet("{sizeId}/{languageId}")]
        public async Task<IActionResult> GetById(int sizeId, string? languageId)
        {
            var product = await _sizeService.GetById(sizeId);
            if (product == null)
                return BadRequest("Cannot find Size!");
            return Ok(product);
        }

        [HttpGet("{productid}&{sizeId}")]
        public async Task<IActionResult> GetSizesByMany(int productId, int sizeId) // chỗ này là colorid do gõ nhầm
        {
            var product = await _sizeService.GetSizesByMany(productId, sizeId);
            if (product == null)
                return BadRequest("Cannot find Sizes!");
            return Ok(product);
        }
        [HttpPost]
        [Consumes("multipart/form-data")]
        [Authorize]
        public async Task<IActionResult> Create([FromForm] CreateSizeRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var size = new Size()
            {
                Name = request.Name,
                Code = request.Code,
                Status = true
            };
            var productId = await _sizeService.Create(size);
            if (productId == 0)
                return BadRequest();

            var product = await _sizeService.GetById(productId);

            return Ok();
        }

        [HttpPut("update")]
        [Consumes("multipart/form-data")]
        [Authorize]
        public async Task<IActionResult> Update([FromForm] UpdateSizeRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var size = new Size()
            {
                Id = request.Id,
                Name = request.Name,
                Code = request.Code,
                Status = true
            };
            var affectedResult = await _sizeService.Update(size);
            if (affectedResult == 0)
                return BadRequest();
            return Ok();
        }

        [HttpDelete("{sizeId}")]
        [Authorize]
        public async Task<IActionResult> Delete(int sizeId)
        {
            var affectedResult = await _sizeService.Delete(sizeId);
            if (affectedResult == 0)
                return BadRequest();
            return Ok();
        }
    }
}
