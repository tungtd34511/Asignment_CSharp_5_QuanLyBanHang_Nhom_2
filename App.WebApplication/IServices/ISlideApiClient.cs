using App.API.Infrastructure.ViewModels.Utilities.Slides;
using Data.Entities;
using Microsoft.AspNetCore.Mvc;

namespace App.WebApplication.IServices
{
    public interface ISlideApiClient
    {
        public Task<List<Slide>> GetAll();

        public Task<bool> Add(SlideAddRequest request);

        public Task<bool> Delete(int id);

        public Task<Slide> GetById(int id);

        public Task<bool> Edit(int id,SlideEditRequest request);
    }
}
