using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App.API.Infrastructure.Utilities.Constants;
using App.API.Infrastructure.ViewModels.Catalog.Carts;
using App.API.Infrastructure.ViewModels.Catalog.Color;
using App.API.Infrastructure.ViewModels.Catalog.Size;
using App.API.Infrastructure.ViewModels.Sales;
using App.WebApplication.IServices;
using App.WebApplication.Models;
using Data.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace App.WebApplication.Controllers
{
    public class SizeController : Controller
    {
        private readonly ISizeApiClient _sizeApiClient;

        public SizeController(ISizeApiClient sizeApiClient)
        {
            _sizeApiClient = sizeApiClient;
        }
        public async Task<IActionResult> Index(string? keyword, int pageIndex = 1, int pageSize = 10)
        {
            var languageId = HttpContext.Session.GetString(SystemConstants.AppSettings.DefaultLanguageId);

            var request = new GetManageSizePagingRequest()
            {
                Keyword = keyword,
                PageIndex = pageIndex,
                PageSize = pageSize,
                LanguageId = languageId
            };
            var data = await _sizeApiClient.GetPagings(request);
            ViewBag.Keyword = keyword;

            if (TempData["result"] != null)
            {
                ViewBag.SuccessMsg = TempData["result"];
            }
            return View(data);
        }
        [Authorize(Roles = "admin,nhanvien")]
        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }
        [Authorize(Roles = "admin,nhanvien")]
        [HttpPost]
        public async Task<IActionResult> Create(CreateSizeRequest request)
        {
            if (!ModelState.IsValid)
                return View(request);

            var result = await _sizeApiClient.Create(request);
            if (result)
            {
                TempData["result"] = "Thêm mới kích cỡ thành công";
                return RedirectToAction("Index");
            }

            ModelState.AddModelError("", "Thêm kích cỡ thất bại");
            return View(request);
        }
        [Authorize(Roles = "admin,nhanvien")]
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var product = await _sizeApiClient.GetById("vi", id);
            var response = new UpdateSizeRequest()
            {
                Id = product.Id,
                Name = product.Name,
                Code = product.Code
            };
            return View(response);
        }
        [Authorize(Roles = "admin,nhanvien")]
        [HttpPost]
        public async Task<IActionResult> Edit( UpdateSizeRequest request)
        {
            if (!ModelState.IsValid)
                return View(request);

            var result = await _sizeApiClient.Update(request);
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