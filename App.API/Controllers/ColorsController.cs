using App.API.Infrastructure.ViewModels.Catalog.Color;
using App.API.Infrastructure.ViewModels.Catalog.ProductImages;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Services.Catalog.Colors;
using App.API.Services.Catalog.Products;
using Data.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Drawing;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace App.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ColorsController : ControllerBase
    {
        private readonly IColorService _colorService;

        public ColorsController(IColorService colorService)
        {
            _colorService = colorService;
        }

        [HttpGet("paging")]
        public async Task<IActionResult> GetAllPaging([FromQuery] GetManageColorPagingRequest request)
        {
            var products = await _colorService.GetAllPaging(request);
            return Ok(products);
        }

        [HttpGet("{colorId}")]
        public async Task<IActionResult> GetById(int colorId)
        {
            var product = await _colorService.GetById(colorId);
            if (product == null)
                return BadRequest("Cannot find color!");
            return Ok(product);
        }


        [HttpPost]
        [Consumes("multipart/form-data")]
        [Authorize]
        public async Task<IActionResult> Create([FromForm] ColorCreateRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var colorId = await _colorService.Create(request);
            if (colorId == 0)
                return BadRequest();

            var product = await _colorService.GetById(colorId);
            return Ok(product);
        }

        [HttpPut]
        [Consumes("multipart/form-data")]
        [Authorize]
        public async Task<IActionResult> Update([FromForm] UpdateColorRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var affectedResult = await _colorService.Update(request);
            if (affectedResult == 0)
                return BadRequest();
            return Ok();
        }

        [HttpDelete("{colorId}")]
        [Authorize]
        public async Task<IActionResult> Delete(int colorId)
        {
            var affectedResult = await _colorService.Delete(colorId);
            if (affectedResult == 0)
                return BadRequest();
            return Ok();
        }
    }
}
