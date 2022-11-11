using App.API.Infrastructure.ViewModels.Utilities.Slides;
using App.WebApplication.IServices;
using Data.Entities;
using Microsoft.AspNetCore.Mvc;
using MVC.Helper;
using System.Net.Http.Json;

namespace App.WebApplication.Services
{
    public class SlideApiClient : ISlideApiClient
    {
        CallApi _helper;

        public SlideApiClient()
        {
            _helper = new CallApi();
        }

        public async Task<bool> Add(SlideAddRequest request)
        {
            var res = await _helper.Initial().PostAsJsonAsync("api/Slides",request);

            if (res.IsSuccessStatusCode)
            {
                return true;
            }
            return false;
        }

        public async Task<bool> Delete(int id)
        {
            var res = await _helper.Initial().DeleteAsync("api/Slides/" + id);

            if (res.IsSuccessStatusCode)
            {
                return true;
            }
            return false;
        }

        public async Task<bool> Edit(int id, SlideEditRequest request)
        {
            var res = await _helper.Initial().PutAsJsonAsync("api/Slides/" + id, request);

            if (res.IsSuccessStatusCode)
            {
                return true;
            }
            return false;
        }

        public async Task<List<Slide>> GetAll()
        {
            return await _helper.Initial().GetFromJsonAsync<List<Slide>>("api/Slides"); ;
        }

        public async Task<Slide> GetById(int id)
        {
            return await _helper.Initial().GetFromJsonAsync<Slide>("api/Slides/" + id);
        }
    }
}
