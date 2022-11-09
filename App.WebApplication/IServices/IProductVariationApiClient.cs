using App.API.Infrastructure.Utilities.Constants;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.Catalog.ProductVariations;
using App.API.Infrastructure.ViewModels.Common;
using System.Net.Http.Headers;
using System.Net.Http;

namespace App.WebApplication.IServices
{
	public interface IProductVariationApiClient
	{
        Task<bool> Create(CreateProductVariationRequest request);

        Task<bool> Update(UpdateProductVariationRequest request);

        Task<PagedResult<ProductVariationVm>> GetPagings(GetManageProductVariationPagingRequest request);

        Task<ProductVariationVm> GetById(int id, string languageId);
    }
}
