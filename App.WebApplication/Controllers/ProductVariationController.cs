using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Data.DbContext;
using Data.Entities;
using App.API.Infrastructure.Utilities.Constants;
using App.API.Infrastructure.ViewModels.Catalog.Color;
using App.WebApplication.IServices;
using App.WebApplication.Services;
using App.API.Infrastructure.ViewModels.Catalog.ProductVariations;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using Microsoft.AspNetCore.Authorization;

namespace App.WebApplication.Controllers
{
    public class ProductVariationController : Controller
    {
        private readonly IProductVariationApiClient  _productVariationApiClient;
        private readonly IColorApiClient _colorApiClient;
        private readonly ISizeApiClient _sizeApiClient;
        private readonly IProductApiClient _productApiClient;
        public ProductVariationController(IProductVariationApiClient productVariationApiClient, ISizeApiClient sizeApiClient, IColorApiClient colorApiClient, IProductApiClient productApiClient)
        {
            _productVariationApiClient = productVariationApiClient;
            _sizeApiClient = sizeApiClient;
            _colorApiClient = colorApiClient;
            _productApiClient = productApiClient;
        }
        // GET: ProductVariation
        public async Task<IActionResult> Index(string? keyword, int? productId , int pageIndex = 1, int pageSize = 10)
        {
            var languageId = HttpContext.Session.GetString(SystemConstants.AppSettings.DefaultLanguageId);

            var request = new GetManageProductVariationPagingRequest()
            {
                Keyword = keyword,
                PageIndex = pageIndex,
                PageSize = pageSize,
                LanguageId = languageId,
                ProductId   = productId
            };
            var data = await _productVariationApiClient.GetPagings(request);
            ViewBag.Keyword = keyword;
            //ViewBag.Categories = data.Items.Select(x => new SelectListItem()
            //{
            //    Text = x.ColorName,
            //    Value = x.ColorId.ToString(),
            //    Selected = productId.HasValue && productId.Value == x.Id
            //});

            if (TempData["result"] != null)
            {
                ViewBag.SuccessMsg = TempData["result"];
            }
            return View(data);
        }
        [HttpGet]
        public async Task<IActionResult> Create()
        {
            var l1 = await _colorApiClient.GetAll("vi");
            var l2 = await _sizeApiClient.GetAll("vi");
            var l3 = await _productApiClient.GetPagings(new() { PageIndex = 1, PageSize = 99 });
            ViewBag.Colors = l1;
            ViewBag.Sizes = l2;
            ViewBag.Products = l3.Items;
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(CreateProductVariationRequest request)
        {
            if (!ModelState.IsValid)
                return View(request);

            var result = await _productVariationApiClient.Create(request);
            if (result)
            {
                TempData["result"] = "Thêm mới biến thể thành công";
                return RedirectToAction("Index");
            }

            ModelState.AddModelError("", "Thêm biến thể thất bại");
            return View(request);
        }
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var product = await _productVariationApiClient.GetById( id, "vi");
            var pv = new UpdateProductVariationRequest() { Id = product.Id,ProductId = product.ProductId,ColorId = product.ColorId, SizeId =product.SizeId,Stock=product.Stock };
            return View(pv);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(UpdateProductVariationRequest request)
        {
            if (!ModelState.IsValid)
                return View(request);

            var result = await _productVariationApiClient.Update(request);
            if (result)
            {
                TempData["result"] = "Cập nhật biến thể thành công";
                return RedirectToAction("Index");
            }

            ModelState.AddModelError("", "Cập nhật biến thể thất bại");
            return View(request);
        }




    }
}
