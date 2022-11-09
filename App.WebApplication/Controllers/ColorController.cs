using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App.API.Infrastructure.Utilities.Constants;
using App.API.Infrastructure.ViewModels.Catalog.Carts;
using App.API.Infrastructure.ViewModels.Catalog.Color;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.Common;
using App.API.Infrastructure.ViewModels.Sales;
using App.WebApplication.IServices;
using App.WebApplication.Models;
using App.WebApplication.Services;
using Data.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Newtonsoft.Json;

namespace App.WebApplication.Controllers
{
    public class ColorController : Controller
    {
        private readonly IColorApiClient _colorApiClient;

        public ColorController(IColorApiClient colorApiClient)
        {
            _colorApiClient = colorApiClient;
        }
        public async Task<IActionResult> Index(string? keyword, int pageIndex = 1, int pageSize = 10)
        {
            var languageId = HttpContext.Session.GetString(SystemConstants.AppSettings.DefaultLanguageId);

            var request = new GetManageColorPagingRequest()
            {
                Keyword = keyword,
                PageIndex = pageIndex,
                PageSize = pageSize,
                LanguageId = languageId
            };
            var data = await _colorApiClient.GetPagings(request);
            ViewBag.Keyword = keyword;

            if (TempData["result"] != null)
            {
                ViewBag.SuccessMsg = TempData["result"];
            }
            return View(data);
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(ColorCreateRequest request)
        {
            if (!ModelState.IsValid)
                return View(request);

            var result = await _colorApiClient.Create(request);
            if (result)
            {
                TempData["result"] = "Thêm mới màu sắc thành công";
                return RedirectToAction("Index");
            }

            ModelState.AddModelError("", "Thêm màu sắc thất bại");
            return View(request);
        }

        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var product = await _colorApiClient.GetById("vi",id);
            var color = new UpdateColorRequest() { Id = product.Id, Name = product.Name, HexCode = product.HEXCode };
            return View(color);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(UpdateColorRequest request)
        {
            if (!ModelState.IsValid)
                return View(request);

            var result = await _colorApiClient.Update(request);
            if (result)
            {
                TempData["result"] = "Cập nhật màu sắc thành công";
                return RedirectToAction("Index");
            }

            ModelState.AddModelError("", "Cập nhật màu sắc thất bại");
            return View(request);
        }
    }
}