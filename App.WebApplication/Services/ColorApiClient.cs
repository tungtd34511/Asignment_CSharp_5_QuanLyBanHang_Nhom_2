
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using App.API.Infrastructure.ViewModels.Catalog.Categories;
using App.WebApplication.IServices;
using Data.Entities;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.Common;
using App.API.Infrastructure.ViewModels.Catalog.Color;
using App.API.Infrastructure.Utilities.Constants;
using System.Net.Http.Headers;

namespace App.WebApplication.Services
{
    public class ColorApiClient : BaseApiClient, IColorApiClient
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IHttpClientFactory _httpClientFactory;
        private readonly IConfiguration _configuration;
        public ColorApiClient(IHttpClientFactory httpClientFactory,
                   IHttpContextAccessor httpContextAccessor,
                    IConfiguration configuration)
            : base(httpClientFactory, httpContextAccessor, configuration)
        {
            _httpContextAccessor = httpContextAccessor;
            _httpClientFactory = httpClientFactory;
            _configuration = configuration;
        }

        public async Task<List<Color>> GetAll(string languageId)
        {
            return await GetListAsync<Color>("/api/Colors?languageId=" + languageId);
        }

        public async Task<Color> GetById(string languageId, int id)
        {
            return await GetAsync<Color>($"/api/Colors/{id}");
        }
        public async Task<PagedResult<Color>> GetPagings(GetManageColorPagingRequest request)
        {
            var data = await GetAsync<PagedResult<Color>>(
                $"/api/Colors/paging?pageIndex={request.PageIndex}" +
                $"&pageSize={request.PageSize}" +
                $"&keyword={request.Keyword}&languageId={request.LanguageId}");
            return data;
        }
        //
        public async Task<bool> Create(ColorCreateRequest color)
        {
            var sessions = _httpContextAccessor
                .HttpContext
                .Session
                .GetString(SystemConstants.AppSettings.Token);
            var languageId = _httpContextAccessor.HttpContext.Session.GetString(SystemConstants.AppSettings.DefaultLanguageId);

            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new Uri(_configuration[SystemConstants.AppSettings.BaseAddress]);
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);

            var requestContent = new MultipartFormDataContent();          
            requestContent.Add(new StringContent(color.Name), "name");
            requestContent.Add(new StringContent(color.HexCode), "hexcode");
            var response = await client.PostAsync($"/api/Colors/", requestContent);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> Update(UpdateColorRequest color)
        {
            var sessions = _httpContextAccessor
                .HttpContext
                .Session
                .GetString(SystemConstants.AppSettings.Token);
            var languageId = _httpContextAccessor.HttpContext.Session.GetString(SystemConstants.AppSettings.DefaultLanguageId);

            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new Uri(_configuration[SystemConstants.AppSettings.BaseAddress]);
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);

            var requestContent = new MultipartFormDataContent();
            requestContent.Add(new StringContent(color.Id.ToString()), "id");
            requestContent.Add(new StringContent(color.Name), "name");
            requestContent.Add(new StringContent(color.HexCode), "hexcode");
            var response = await client.PutAsync($"/api/Colors/", requestContent);
            return response.IsSuccessStatusCode;
        }
    }
}