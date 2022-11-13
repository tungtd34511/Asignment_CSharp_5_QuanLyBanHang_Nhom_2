
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App.API.Infrastructure.ViewModels.Catalog.Categories;
using App.API.Infrastructure.ViewModels.Catalog.Color;
using App.API.Infrastructure.ViewModels.Common;

namespace App.WebApplication.IServices
{
    public interface ICategoryApiClient
    {
        Task<List<CategoryVm>> GetAll(string languageId);

        Task<CategoryVm> GetById(string languageId, int id);
        Task<bool> Create(CreateCatergoryRequest request);
        Task<PagedResult<CatergoryVMinAdmin>> GetPagings(GetPagingCategoryRequest request);
    }
}