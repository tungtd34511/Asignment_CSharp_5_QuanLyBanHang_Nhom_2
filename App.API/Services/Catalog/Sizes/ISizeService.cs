using App.API.Infrastructure.ViewModels.Catalog.ProductImages;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.Catalog.Size;
using App.API.Infrastructure.ViewModels.Common;
using Data.Entities;
using Microsoft.EntityFrameworkCore;

namespace App.API.Services.Catalog.Sizes
{
    public interface ISizeService
    {
        Task<int> Create(Size request);

        Task<int> Update(Size request);

        Task<int> Delete(int Id);

        Task<Size> GetById(int id);
        Task<IEnumerable<Size>> GetSizesByMany(int productid, int colorId);
        Task<PagedResult<Size>> GetAllPaging(GetManageSizePagingRequest request);
         Task<List<Size>> GetAll();
    }
}
