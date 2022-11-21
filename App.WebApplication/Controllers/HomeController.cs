using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using App.API.Infrastructure.Utilities.Constants;
using App.WebApplication.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;
using App.API.Services.Catalog.Carts;
using Newtonsoft.Json;
using App.WebApplication.IServices;

namespace App.WebApplication.Controllers
{
    public class HomeController : BaseController
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ICartApiClient _cartApiClient;

        public HomeController(ILogger<HomeController> logger, ICartApiClient cartApiClient)
        {
            _logger = logger;
            _cartApiClient = cartApiClient;
        }
       
        public async Task<IActionResult> Index()
        {
            var user = User.Identity.Name;
            var role = User.Claims.Where(c => c.Type == ClaimTypes.Role).Select(c=>c.Value).ToList();
            foreach (var roleClaim in role)
            {
                if (!roleClaim.IsNullOrEmpty())
                {
                    return View();
                }
            }
            await this.AsyncCart();
            return RedirectToAction("Index", "Shop");
        }

        private async Task<bool> AsyncCart()
        {
            List<CartItemViewModel> currentCart = new List<CartItemViewModel>();
            var session = HttpContext.Session.GetString(SystemConstants.CartSession);
            if (session != null)
            {
                currentCart = JsonConvert.DeserializeObject<List<CartItemViewModel>>(session);
            }
            if (User.Identity.IsAuthenticated && session!=null)
            {
                var result = await _cartApiClient.AsyncCart(currentCart);
                HttpContext.Session.Remove(SystemConstants.CartSession);
                return result;
            }
            return false;
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

        [HttpPost]
        public IActionResult Language(NavigationViewModel viewModel)
        {
            HttpContext.Session.SetString(SystemConstants.AppSettings.DefaultLanguageId,
                viewModel.CurrentLanguageId);

            return Redirect(viewModel.ReturnUrl);
        }
    }
}