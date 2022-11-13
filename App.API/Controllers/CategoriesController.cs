using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App.API.Infrastructure.ViewModels.Catalog.Categories;
using App.API.Services.Catalog.Categories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace App.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriesController : ControllerBase
    {
        private readonly ICategoryService _categoryService;

        public CategoriesController(
            ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll(string languageId)
        {
            var products = await _categoryService.GetAll(languageId);
            return Ok(products);
        }

        [HttpGet("{id}/{languageId}")]
        public async Task<IActionResult> GetById(string languageId, int id)
        {
            var category = await _categoryService.GetById(languageId, id);
            return Ok(category);
        }
        [HttpGet("paging")]
        public async Task<IActionResult> GetPaging([FromQuery] GetPagingCategoryRequest request)
        {
            var products = await _categoryService.GetPaging(request);
            return Ok(products);
        }
        [HttpPost]
        public async Task<IActionResult> Create( CreateCatergoryRequest request)
        {
            var result = await _categoryService.Create(request);
            if (result == 0)
                return BadRequest();
            return Ok(result);
        }
    }
}