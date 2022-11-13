using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Localization;
using Microsoft.AspNetCore.Http;
using LazZiya.ExpressLocalization;
using System.Globalization;
using App.API.Infrastructure.Utilities.Constants;
using App.WebApplication.IServices;
using App.WebApplication.Models;
using App.API.Services.Catalog.Carts;
using App.WebApplication.Services;
using Newtonsoft.Json;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Data.Common;
using Microsoft.AspNetCore.Mvc.RazorPages;
using App.API.Infrastructure.ViewModels.Common;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace App.WebApplication.Controllers
{
    public class ShopController : Controller
    {
        private readonly ILogger<ShopController> _logger;
        private readonly ISharedCultureLocalizer _loc;
        private readonly ISlideApiClient _slideApiClient;
        private readonly IProductApiClient _productApiClient;
        private readonly ISizeApiClient _sizeApiClient;
        private readonly ICategoryApiClient _categoryApiClient;
        private readonly IColorApiClient _colorApiClient;
        public ShopController(ILogger<ShopController> logger,
            ISlideApiClient slideApiClient,
            IProductApiClient productApiClient,
            ISizeApiClient sizeApiClient,
            ICategoryApiClient categoryApiClient,
            IColorApiClient colorApiClient)
        {
            _logger = logger;
            _slideApiClient = slideApiClient;
            _productApiClient = productApiClient;
            _sizeApiClient = sizeApiClient;
            _categoryApiClient = categoryApiClient;
            _colorApiClient = colorApiClient;
        }
        public async Task<IActionResult> Index()
        {
            var culture = CultureInfo.CurrentCulture.Name;
            var viewModel = new HomeViewModel
            {
                Slides = await _slideApiClient.GetAll(),
                FeaturedProducts = await _productApiClient.GetFeaturedProducts(culture, SystemConstants.ProductSettings.NumberOfFeaturedProducts),
                LatestProducts = await _productApiClient.GetLatestProducts(culture, SystemConstants.ProductSettings.NumberOfLatestProducts),
            };

            return View(viewModel);
        }
        public IActionResult SetPageIndex(int index)
        {
            HttpContext.Session.SetString("PageIndex", JsonConvert.SerializeObject(index));
            return Ok();
        }
        public async Task<IActionResult> Shopping(ShopingResult? shopingResult)
        {
            var session =  HttpContext.Session.GetString("PageIndex");
            if (session != null)
            {
                shopingResult.PageIndex = JsonConvert.DeserializeObject<int>(session);
                HttpContext.Session.Remove(session);
            }
            var languageId = HttpContext.Session.GetString(SystemConstants.AppSettings.DefaultLanguageId);
            var request = new GetManageProductPagingRequest();
            if (shopingResult.Checklists != null)
            {
                    request.Keyword = shopingResult.Keyword;
                    request.PageIndex =  shopingResult.PageIndex < 1?1: shopingResult.PageIndex;
                    request.PageSize =  16;
                    request.LanguageId = "vi";
                    request.CategoryId = null;
                    request.Checks = shopingResult.Checklists!=null?  shopingResult.Checklists.Select(c => c.Check).ToList():new List<bool>();
            }
            else
            {
                request.Keyword = "";
                request.PageIndex = 1;
                request.PageSize = 16;
                request.LanguageId = "vi";
                request.CategoryId = null;
                request.Checks = new List<bool>();
            }
              
            
            var data = await _productApiClient.GetPagings2(request);
            var data2 = new ShopingResult() {PageSize = data.PageSize,Items=data.Items,PageIndex=data.PageIndex,TotalRecords=data.TotalRecords};
            ViewBag.Keyword = "";
            
            var categories = await _categoryApiClient.GetAll("vi");
            
            
            var prices = new List<string>()
            {
                "Lower 199.000 VND","199.000 VND - 299.000 VND","299.000 VND - 399.000 VND","399.000 VND - 499.000 VND","499.000 VND - 799.000 VND","799.000 VND - 999.000 VND","Upper 999.000 VND"
            };
            
            var colors = await _colorApiClient.GetAll("vi");
            
            var sizes = await _sizeApiClient.GetAll("vi");
            int i = 0;
            var count = categories.Count()+prices.Count()+colors.Count()+sizes.Count();
            if (shopingResult == null) {
                shopingResult = new ShopingResult();
            
            }
            if (shopingResult.Checklists == null || !shopingResult.Checklists.Any())
            {
                shopingResult.Checklists = new();
                for (int j = 0; j < count; j++)
                {
                    shopingResult.Checklists.Add(new API.Infrastructure.ViewModels.System.Roles.Checked() { Check = false });
                }
            }
            //
            var lstSeletedPrices = new List<SelectListItem>();
            foreach (var item in prices)
            {
                lstSeletedPrices.Add(new SelectListItem()
                {
                    Value = item,
                    Selected = shopingResult.Checklists[i].Check
                });
                i++;
            }
            ViewBag.Prices = lstSeletedPrices;
            //
            var lstSeletedCategories = new List<SelectListItem>();
            foreach (var item in categories)
            {
                lstSeletedCategories.Add(new SelectListItem()
                {
                    Value = item.Name,
                    Selected = shopingResult.Checklists[i].Check /// auto tăng giá trị của i
                });
                i++;
            }
            ViewBag.Categories = lstSeletedCategories;

            //
            
            //

            var lstSeletedSizes = new List<SelectListItem>();
            foreach (var item in sizes)
            {
                lstSeletedSizes.Add(new SelectListItem()
                {
                    Value = item.Name,
                    Selected = shopingResult.Checklists[i].Check /// auto tăng giá trị của i
                });
                i++;
            }
            ViewBag.Sizes = lstSeletedSizes;
            //
            var lstSeletedColors = new List<SelectListItem>();
            foreach(var item  in colors)
            {
                lstSeletedColors.Add(new SelectListItem()
                {
                    Value = item.Name,
                    Selected = shopingResult.Checklists[i].Check
                });
                i++;
            }
            ViewBag.Colors = lstSeletedColors;

            if (TempData["result"] != null)
            {
                ViewBag.SuccessMsg = TempData["result"];
            }
            return View(data2);
            //
        }
        [HttpGet]
        public async Task<IActionResult> GetSizesByMany(int productid, int colorId)
        {
            var result = await _sizeApiClient.GetSizesByMany(productid, colorId);
            return Ok(result);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public IActionResult SetCultureCookie(string cltr, string returnUrl)
        {
            Response.Cookies.Append(
                CookieRequestCultureProvider.DefaultCookieName,
                CookieRequestCultureProvider.MakeCookieValue(new RequestCulture(cltr)),
                new CookieOptions { Expires = DateTimeOffset.UtcNow.AddYears(1) }
                );

            return LocalRedirect(returnUrl);
        }
    }
}