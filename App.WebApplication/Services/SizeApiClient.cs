
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
using App.API.Infrastructure.ViewModels.System.Languages;
using App.API.Infrastructure.Utilities.Constants;
using System.Net.Http.Headers;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.Common;
using App.API.Infrastructure.ViewModels.Catalog.Size;

namespace App.WebApplication.Services
{
    public class SizeApiClient : BaseApiClient, ISizeApiClient
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IHttpClientFactory _httpClientFactory;
        private readonly IConfiguration _configuration;
        public SizeApiClient(IHttpClientFactory httpClientFactory,
                   IHttpContextAccessor httpContextAccessor,
                    IConfiguration configuration)
            : base(httpClientFactory, httpContextAccessor, configuration)
        {
            _httpClientFactory = httpClientFactory;
            _configuration = configuration;
            _httpContextAccessor = httpContextAccessor;
        }

        public async Task<List<Size>> GetAll(string languageId)
        {
            return await GetListAsync<Size>("/api/Sizes?languageId=" + languageId);
        }

        public async Task<Size> GetById(string languageId, int id)
        {
            return await GetAsync<Size>($"/api/Sizes/{id}/{languageId}");
        }

        public async Task<IEnumerable<Size>> GetSizesByMany(int productid, int sizeId)
        {
            return await GetListAsync<Size>($"/api/Sizes/{productid}&{sizeId}");
        }
        public async Task<PagedResult<Size>> GetPagings(GetManageSizePagingRequest request)
        {
            var data = await GetAsync<PagedResult<Size>>(
                $"/api/Sizes/paging?pageIndex={request.PageIndex}" +
                $"&pageSize={request.PageSize}" +
                $"&keyword={request.Keyword}&languageId={request.LanguageId}");
            return data;
        }
        public async Task<bool> Create(CreateSizeRequest size)
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
            requestContent.Add(new StringContent(size.Name), "name");
            requestContent.Add(new StringContent(size.Code), "code");
            var response = await client.PostAsync($"/api/Sizes/", requestContent);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> Update(UpdateSizeRequest size)
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
            requestContent.Add(new StringContent(size.Id.ToString()), "id");
            requestContent.Add(new StringContent(size.Name), "name");
            requestContent.Add(new StringContent(size.Code), "code");
            var response = await client.PostAsync($"/api/Sizes/", requestContent);
            return response.IsSuccessStatusCode;
        }
    }
}