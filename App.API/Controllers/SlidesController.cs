using System.Threading.Tasks;
using App.API.Infrastructure.ViewModels.Utilities.Slides;
using App.API.Services.Utilities.Slides;
using Data.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace App.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class SlidesController : ControllerBase
    {
        private readonly ISlideService _slideService;

        public SlidesController(ISlideService slideService)
        {
            _slideService = slideService;
        }

        [HttpGet]
        [AllowAnonymous]
        public async Task<List<Slide>> GetAll()
        {
            var slides = await _slideService.GetAll();
            return slides;
        }

        [HttpGet("{id}")]
        [AllowAnonymous]
        public async Task<Slide> GetById(int id)
        {
            var slide = await _slideService.GetById(id);
            return slide;
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> Add(SlideAddRequest request)
        {
            if (await _slideService.Add(request)) return Ok(request);
            return BadRequest();
        }

        [HttpPut("{id}")]
        [AllowAnonymous]
        public async Task<IActionResult> Edit(int id,SlideEditRequest request)
        {
            if (await _slideService.Edit(id,request)) return Ok(request);
            return BadRequest();
        }

        [HttpDelete("{id}")]
        [AllowAnonymous]
        public async Task<IActionResult> Delete(int id)
        {
            if (await _slideService.Delete(id)) return Ok();
            return BadRequest();
        }
    }
}