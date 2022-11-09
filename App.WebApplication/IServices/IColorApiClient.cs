
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App.API.Infrastructure.ViewModels.Catalog.Categories;
using App.API.Infrastructure.ViewModels.Catalog.Color;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.Common;
using Data.Entities;

namespace App.WebApplication.IServices
{
    public interface IColorApiClient
    {
        Task<List<Color>> GetAll(string languageId);

        Task<Color> GetById(string languageId, int id);
        Task<PagedResult<Color>> GetPagings(GetManageColorPagingRequest request);
        Task<bool> Create(ColorCreateRequest request);
        Task<bool> Update(UpdateColorRequest request);
    }
}