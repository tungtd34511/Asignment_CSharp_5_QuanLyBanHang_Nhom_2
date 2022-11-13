using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using App.API.Infrastructure.ViewModels.Catalog.Categories;
using App.API.Infrastructure.ViewModels.Common;

namespace App.API.Services.Catalog.Categories
{
    public interface ICategoryService
    {
        Task<List<CategoryVm>> GetAll(string languageId);

        Task<CategoryVm> GetById(string languageId, int id);
        Task<int> Create(CreateCatergoryRequest request);
        Task<PagedResult<CatergoryVMinAdmin>> GetPaging(GetPagingCategoryRequest request);
    }
}