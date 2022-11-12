using App.API.Infrastructure.ViewModels.Catalog.Promotion;
using App.API.Services.Catalog.Promotions;
using Data.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace App.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PromotionsController : ControllerBase
    {
        private readonly IPromotionServices _promotionServices;

        public PromotionsController(IPromotionServices promotionServices)
        {
            _promotionServices = promotionServices;
        }

        [HttpGet]
        public async Task<List<Promotion>> GetAll()
        {
            return await _promotionServices.GetAll();
        }

        [HttpGet("{id}")]
        public async Task<Promotion> GetById(int id)
        {
            return await _promotionServices.GetById(id);
        }

        [HttpPost]
        public async Task<IActionResult> Add(PromotionAddRequest request)
        {
            if (await _promotionServices.Add(request)) return Ok(request);

            return BadRequest();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Edit(int id,PromotionEditRequest request)
        {
            if (await _promotionServices.Edit(id,request)) return Ok(request);

            return BadRequest();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            if (await _promotionServices.Delete(id)) return Ok();

            return BadRequest();
        }
    }
}
