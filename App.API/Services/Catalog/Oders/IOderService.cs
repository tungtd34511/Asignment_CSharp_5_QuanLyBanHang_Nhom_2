using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using System.Threading.Tasks;
using App.API.Infrastructure.ViewModels.Catalog.ProductImages;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.Common;
using App.API.Infrastructure.ViewModels.Catalog.Oders;
using Data.Enums;
using Data.Entities;

namespace App.API.Services.Catalog.Oders
{
    public interface IOderService
    {
        Task<int> Create(CreateOderReqquest request);

        Task<int> Update(UpdateOderRequest request);

        Task<int> Delete(int Id);
        Task<OderVm> GetById(int id, string languageId);
        Task<bool> UpdateStatus(UpdateOrderStatusRequest request);
        Task<PagedResult<OderVm>> GetAllPaging(GetOrdersRequest request);
    }
}