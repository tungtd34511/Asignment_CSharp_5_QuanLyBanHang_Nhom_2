using App.API.Infrastructure.ViewModels.Utilities.Slides;
using App.WebApplication.IServices;
using App.WebApplication.Models;
using Microsoft.AspNetCore.Mvc;

namespace App.WebApplication.Controllers
{
    public class SlideController : Controller
    {
        private readonly ISlideApiClient _slideApiClient;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public SlideController(ISlideApiClient slideApiClient, IWebHostEnvironment webHostEnvironment)
        {
            _slideApiClient = slideApiClient;
            _webHostEnvironment = webHostEnvironment;
        }

        public async Task<IActionResult> Index()
        {
            ViewData["lst"] = await _slideApiClient.GetAll();
            if (TempData["message"] != null)
            {
                ViewBag.message = TempData["message"];
            }
            return View();
        }

        public string Upload(SlideModel model)
        {
            string wwwRootPath = _webHostEnvironment.WebRootPath;
            string filename = Path.GetFileNameWithoutExtension(model.ImageFile.FileName);
            string extention = Path.GetExtension(model.ImageFile.FileName);
            string pathfileimage = filename + extention;
            string parth = Path.Combine(wwwRootPath + "/images/SlideImage/", pathfileimage);
            var fileStream = new FileStream(parth, FileMode.Create);
            model.ImageFile.CopyTo(fileStream);
            return pathfileimage;
        }

        public async Task<IActionResult> Add(SlideModel model)
        {
            if (ModelState.IsValid)
            {
                var filename = Upload(model);

                var request = new SlideAddRequest()
                {
                    Name = model.Name,
                    Description = model.Description,
                    SortOrder = model.SortOrder,
                    Url = "#",
                    Image = filename,
                };

                if (await _slideApiClient.Add(request))
                {
                    TempData["message"] = "thanh cong";
                    return RedirectToAction("Index");
                }
            }
            return RedirectToAction("Index");
        }


        public async Task<IActionResult> Delete(int id)
        {
            if (await _slideApiClient.Delete(id))
            {
                TempData["message"] = "thanh cong";
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
        }

        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var slide = await _slideApiClient.GetById(id);

            var model = new SlideModel()
            {
                id = id,
                Name = slide.Name,
                Description = slide.Description,
                SortOrder = slide.SortOrder,
                ImageFile = null,
            };

            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(SlideModel model)
        {
            if (ModelState.IsValid)
            {
                var filename = Upload(model);

                var request = new SlideEditRequest()
                {
                    id = model.id,
                    Name = model.Name,
                    Description = model.Description,
                    SortOrder = model.SortOrder,
                    Url = "#",
                    Image = filename,
                };

                if (await _slideApiClient.Edit(request.id, request))
                {
                    TempData["message"] = "thanh cong";
                    return RedirectToAction("Index");
                }
            }
            return RedirectToAction("Index");
        }
    }
}
