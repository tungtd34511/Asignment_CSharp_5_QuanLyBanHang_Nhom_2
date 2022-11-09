
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App.API.Infrastructure.ViewModels.Catalog.Categories;
using App.API.Infrastructure.ViewModels.Catalog.Size;
using App.API.Infrastructure.ViewModels.Common;
using Data.Entities;

namespace App.WebApplication.IServices
{
    public interface ISizeApiClient
    {
        Task<List<Size>> GetAll(string languageId);

        Task<Size> GetById(string languageId, int id);
        Task<IEnumerable<Size>> GetSizesByMany(int productid, int sizeId);
        Task<PagedResult<Size>> GetPagings(GetManageSizePagingRequest request);
        Task<bool> Create(CreateSizeRequest size);
        Task<bool> Update(UpdateSizeRequest size);
    }
}