using App.API.Infrastructure.ViewModels.Catalog.Color;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.Catalog.ProductVariations;
using App.API.Infrastructure.ViewModels.Common;
using Data.Entities;

namespace App.API.Services.Catalog.ProductVariations
{
    public interface IProductVariationService
    {
        Task<List<ProductVariationVm>> GetByProductVariationsAsync();
        Task<List<ProductVariationVm>> GetByProductVariationsByProductIdAsync(int id);
        Task<PagedResult<ProductVariationVm>> GetAllPaging(GetManageProductVariationPagingRequest request);
        Task<ProductVariationVm> GetById(int id);
        Task<int> Create(ProductVariation request);
        int Update(ProductVariation request);
    }
}
