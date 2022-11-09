using App.API.Infrastructure.Utilities.Constants;
using App.API.Infrastructure.ViewModels.Catalog.Carts;
using App.API.Infrastructure.ViewModels.Catalog.Color;
using App.API.Infrastructure.ViewModels.Catalog.Oders;
using App.API.Infrastructure.ViewModels.Common;
using App.API.Infrastructure.ViewModels.System.Users;
using App.API.Services.Catalog.Carts;
using App.WebApplication.IServices;
using Data.Entities;
using Microsoft.AspNetCore.Mvc;
using System.Net.Http.Headers;

namespace App.WebApplication.Services
{
    public class CartApiClient : BaseApiClient, ICartApiClient
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IHttpClientFactory _httpClientFactory;
        private readonly IConfiguration _configuration;
        public CartApiClient(IHttpClientFactory httpClientFactory,
                   IHttpContextAccessor httpContextAccessor,
                    IConfiguration configuration)
            : base(httpClientFactory, httpContextAccessor, configuration)
        {
            _httpContextAccessor = httpContextAccessor;
            _httpClientFactory = httpClientFactory;
            _configuration = configuration;
        }

        public async Task<List<CartItemViewModel>> GetByUser(string userId)
        {
            return await GetListAsync<CartItemViewModel>($"/api/Carts/{userId}");
        }

        public async Task<Color> GetById(string languageId, int id)
        {
            return await GetAsync<Color>($"/api/Carts/{id}");
        }
        public async Task<bool> AddToCart(AddToCartRequest request)
        {
            var sessions = _httpContextAccessor
                .HttpContext
                .Session
                .GetString(SystemConstants.AppSettings.Token);
            var languageId = _httpContextAccessor.HttpContext.Session.GetString(SystemConstants.AppSettings.DefaultLanguageId);

            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new Uri(_configuration[SystemConstants.AppSettings.BaseAddress]);
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);

            var response = await client.PostAsJsonAsync($"/api/Carts/", request);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> Update(UpdateCartRequest request)
        {
            var sessions = _httpContextAccessor
                .HttpContext
                .Session
                .GetString(SystemConstants.AppSettings.Token);
            var languageId = _httpContextAccessor.HttpContext.Session.GetString(SystemConstants.AppSettings.DefaultLanguageId);

            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new Uri(_configuration[SystemConstants.AppSettings.BaseAddress]);
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);

            var response = await client.PutAsJsonAsync($"/api/Carts/", request);
            return response.IsSuccessStatusCode;
        }
        public async Task<bool> DeleteCart(string userid)
        {
            var sessions = _httpContextAccessor
                .HttpContext
                .Session
                .GetString(SystemConstants.AppSettings.Token);
            var languageId = _httpContextAccessor.HttpContext.Session.GetString(SystemConstants.AppSettings.DefaultLanguageId);

            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new Uri(_configuration[SystemConstants.AppSettings.BaseAddress]);
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);

            var response = await client.DeleteAsync($"/api/Carts/delete-cart/{userid}");
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> Checkout(CreateOderReqquest request)
        {
            var sessions = _httpContextAccessor
                .HttpContext
                .Session
                .GetString(SystemConstants.AppSettings.Token);
            var languageId = _httpContextAccessor.HttpContext.Session.GetString(SystemConstants.AppSettings.DefaultLanguageId);

            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new Uri(_configuration[SystemConstants.AppSettings.BaseAddress]);
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);
            var response = await client.PostAsJsonAsync($"/api/Carts/check-out/", request);
            return response.IsSuccessStatusCode;
        }
        public async Task<bool> AsyncCart(List<CartItemViewModel> request)
        {
            var sessions = _httpContextAccessor
                .HttpContext
                .Session
                .GetString(SystemConstants.AppSettings.Token);
            var languageId = _httpContextAccessor.HttpContext.Session.GetString(SystemConstants.AppSettings.DefaultLanguageId);

            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new Uri(_configuration[SystemConstants.AppSettings.BaseAddress]);
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);
            var response = await client.PostAsJsonAsync($"/api/Carts/AsyncCart/", request);
            return response.IsSuccessStatusCode;
        }
    }
}
