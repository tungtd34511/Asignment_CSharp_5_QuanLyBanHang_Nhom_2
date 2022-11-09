using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using App.API.Infrastructure.ViewModels.Utilities.Slides;

namespace App.API.Services.Utilities.Slides
{
    public interface ISlideService
    {
        Task<List<SlideVm>> GetAll();
    }
}