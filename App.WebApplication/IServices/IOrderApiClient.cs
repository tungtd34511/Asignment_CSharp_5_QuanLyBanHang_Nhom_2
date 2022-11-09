using App.API.Infrastructure.ViewModels.Catalog.Oders;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.Common;
using System;
using System.Collections.Generic;
using System.Text;

namespace App.WebApplication.IServices
{
    public interface IOrderApiClient
    {
        Task<bool> Create(CreateOderReqquest request);
        Task<bool> UpdateProduct(UpdateOderRequest request);
        Task<PagedResult<ProductVm>> GetPagings(GetCartsRequest request);
        Task<ProductVm> GetById(int id, string languageId);
        Task<bool> UpdateStatus(DeleteCartRequest request);
    }
}