using App.API.Infrastructure.Utilities.Constants;
using App.API.Infrastructure.ViewModels.Catalog.Categories;
using App.API.Infrastructure.ViewModels.Catalog.Color;
using App.WebApplication.IServices;
using App.WebApplication.Services;
using Data.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace App.WebApplication.Controllers
{
    public class CategoryController : Controller
    {
        private readonly ICategoryApiClient _categoryApiClient;

        public CategoryController(ICategoryApiClient categoryApiClient)
        {
            _categoryApiClient = categoryApiClient;
        }

        public async Task<IActionResult> Index(string? keyword, int pageIndex = 1, int pageSize = 10)
        {
            var languageId = HttpContext.Session.GetString(SystemConstants.AppSettings.DefaultLanguageId);

            var request = new GetPagingCategoryRequest()
            {
                Keyword = keyword,
                PageIndex = pageIndex,
                PageSize = pageSize,
                LanguageId = "vi"
            };
            var data = await _categoryApiClient.GetPagings(request);
            
            
            ViewBag.Keyword = keyword;

            if (TempData["result"] != null)
            {
                ViewBag.SuccessMsg = TempData["result"];
            }
            return View(data);
        }
        [Authorize(Roles = "admin,nhanvien")]
        [HttpGet]
        public async Task<IActionResult> Create()
        {
            var cartes = await _categoryApiClient.GetAll("vi");
            cartes.Add(new CategoryVm { Name = "Không" });
            ViewBag.Catergories = cartes.Select(c => new SelectListItem()
            {
                Value = c.Id.ToString(),
                Text = c.Name,
            }).ToList();
            return View();
        }
        [Authorize(Roles = "admin,nhanvien")]
        [HttpPost]
        public async Task<IActionResult> Create(CreateCatergoryRequest request)
        {
            var cartes = await _categoryApiClient.GetAll("vi");
            cartes.Add(new CategoryVm { Name = "Không" });
            ViewBag.Catergories = cartes.Select(c => new SelectListItem()
            {
                Value = c.Id.ToString(),
                Text = c.Name,
            }).ToList();
            if (!ModelState.IsValid)
                return View(request);

            var result = await _categoryApiClient.Create(request);
            if (result)
            {
                TempData["result"] = "Thêm mới danh mục sản phẩm thành công";
                return RedirectToAction("Index");
            }

            ModelState.AddModelError("", "Thêm danh mục sản phẩm thất bại");
            return View(request);
        }
        
    }
}
