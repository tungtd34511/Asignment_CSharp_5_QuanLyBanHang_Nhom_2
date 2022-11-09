using System.ComponentModel;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.Common;
using App.API.Infrastructure.ViewModels.Sales;
using Microsoft.AspNetCore.Mvc;

namespace App.WebApplication.Controllers.Components
{
    public class BillDetailViewComponent : ViewComponent
    {
        public async Task<IViewComponentResult> InvokeAsync(CheckoutRequest result)
        {
            return await Task.FromResult((IViewComponentResult)View("BillDetail", result));
        }
    }
}
