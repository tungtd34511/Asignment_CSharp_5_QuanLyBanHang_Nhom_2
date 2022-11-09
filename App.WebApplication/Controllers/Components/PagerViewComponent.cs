using System.ComponentModel;
using App.API.Infrastructure.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;

namespace App.WebApplication.Controllers.Components
{
    public class PagerViewComponent : ViewComponent
    {
        public async Task<IViewComponentResult> InvokeAsync(PagedResultBase result)
        {
            return await Task.FromResult((IViewComponentResult)View("Default", result));
        }
    }
}
