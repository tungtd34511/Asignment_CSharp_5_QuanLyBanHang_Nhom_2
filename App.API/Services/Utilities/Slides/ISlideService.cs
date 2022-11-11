using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using App.API.Infrastructure.ViewModels.Utilities.Slides;
using Data.Entities;

namespace App.API.Services.Utilities.Slides
{
    public interface ISlideService
    {
        public Task<List<Slide>> GetAll();

        public Task<Slide> GetById(int id);

        public Task<bool> Add(SlideAddRequest request);

        public Task<bool> Edit(int id,SlideEditRequest request);

        public Task<bool> Delete(int id);
    }
}