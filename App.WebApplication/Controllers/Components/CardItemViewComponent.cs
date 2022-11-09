using System.ComponentModel;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;

namespace App.WebApplication.Controllers.Components
{
    public class CardItemViewComponent : ViewComponent
    {
        public async Task<IViewComponentResult> InvokeAsync(ProductVm result)
        {
            return await Task.FromResult((IViewComponentResult)View("MiniItemCard", result));
        }
    }
}
