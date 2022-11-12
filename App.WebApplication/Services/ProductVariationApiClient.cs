using App.API.Infrastructure.Utilities.Constants;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.Catalog.ProductVariations;
using App.API.Infrastructure.ViewModels.Common;
using App.WebApplication.IServices;
using Newtonsoft.Json;
using System.Net.Http.Headers;
using System.Text;

namespace App.WebApplication.Services
{
	public class ProductVariationApiClient : BaseApiClient, IProductVariationApiClient
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IHttpClientFactory _httpClientFactory;
        private readonly IConfiguration _configuration;

        public ProductVariationApiClient(IHttpClientFactory httpClientFactory,
                   IHttpContextAccessor httpContextAccessor,
                    IConfiguration configuration)
            : base(httpClientFactory, httpContextAccessor, configuration)
        {
            _httpContextAccessor = httpContextAccessor;
            _configuration = configuration;
            _httpClientFactory = httpClientFactory;
        }
        public async Task<bool> Create(CreateProductVariationRequest request)
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
            requestContent.Add(new StringContent(request.ProductId.ToString()), "productId");
            requestContent.Add(new StringContent(request.ColorId.ToString()), "colorId");
            requestContent.Add(new StringContent(request.SizeId.ToString()), "sizeid");
            requestContent.Add(new StringContent(request.StocK.ToString()), "stocK");
            var response = await client.PostAsync($"/api/ProductVariations/", requestContent);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> Update(UpdateProductVariationRequest request)
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
            requestContent.Add(new StringContent(request.Id.ToString()), "id");
            requestContent.Add(new StringContent(request.ProductId.ToString()), "productId");
            requestContent.Add(new StringContent(request.ColorId.ToString()), "colorId");
            requestContent.Add(new StringContent(request.SizeId.ToString()), "sizeid");
            requestContent.Add(new StringContent(request.Stock.ToString()), "stock");
            var response = await client.PutAsync($"/api/ProductVariations/", requestContent);
            return response.IsSuccessStatusCode;
        }

        public async Task<PagedResult<ProductVariationVm>> GetPagings(GetManageProductVariationPagingRequest request)
        {
            var data = await GetAsync<PagedResult<ProductVariationVm>>(
                $"/api/ProductVariations/paging?pageIndex={request.PageIndex}" +
                $"&pageSize={request.PageSize}" +
                $"&keyword={request.Keyword}&languageId={request.LanguageId}&categoryId={request.ProductId}");

            return data;
        }

        public async Task<ProductVariationVm> GetById(int id, string languageId)
        {
            var data = await GetAsync<ProductVariationVm>($"/api/ProductVariations/{id}/{languageId}");

            return data;
        }
    }
}
