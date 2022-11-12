using App.API.Infrastructure.ViewModels.Catalog.Color;
using App.API.Infrastructure.ViewModels.Catalog.ProductImages;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.Common;
using Data.Entities;

namespace App.API.Services.Catalog.Colors
{
    public interface IColorService
    {
        Task<int> Create(ColorCreateRequest request);

        Task<int> Update(UpdateColorRequest request);

        Task<int> Delete(int colorId);

        Task<Color> GetById(int id);
        Task<PagedResult<Color>> GetAllPaging(GetManageColorPagingRequest request);
        Task<List<Color>> GetAll();
    }
}
