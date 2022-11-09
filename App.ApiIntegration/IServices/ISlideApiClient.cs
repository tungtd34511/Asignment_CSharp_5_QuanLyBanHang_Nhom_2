
using System.Collections.Generic;
using System.Threading.Tasks;
using App.API.Infrastructure.ViewModels.Utilities.Slides;

namespace App.ApiIntegration.IServices
{
    public interface ISlideApiClient
    {
        Task<List<SlideVm>> GetAll();
    }
}