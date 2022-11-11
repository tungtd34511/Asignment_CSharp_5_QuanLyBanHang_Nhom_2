using App.API.Infrastructure.ViewModels.Catalog.Promotion;
using App.WebApplication.IServices;
using Data.Entities;
using MVC.Helper;

namespace App.WebApplication.Services
{
    public class PromotionApiClient : IPromotionApiClient
    {
        CallApi _Helper;

        public PromotionApiClient()
        {
            _Helper = new CallApi();
        }

        public async Task<bool> Add(PromotionAddRequest request)
        {
            var res = await _Helper.Initial().PostAsJsonAsync("api/Promotions", request);

            if (res.IsSuccessStatusCode) return true;
            return false;
        }

        public async Task<bool> Delete(int id)
        {
            var res = await _Helper.Initial().DeleteAsync("api/Promotions/" + id);

            if (res.IsSuccessStatusCode) return true;
            return false;
        }

        public async Task<bool> Edit(int id, PromotionEditRequest request)
        {
            var res = await _Helper.Initial().PutAsJsonAsync("api/Promotions/" + id,request);

            if (res.IsSuccessStatusCode) return true;
            return false;
        }

        public async Task<List<Promotion>> GetAll()
        {
            List<Promotion> promotions = new List<Promotion>();
            promotions = await _Helper.Initial().GetFromJsonAsync<List<Promotion>>("api/Promotions");
            return promotions;
        }

        public async Task<Promotion> GetById(int id)
        {
            return await _Helper.Initial().GetFromJsonAsync<Promotion>("api/Promotions/" + id);
        }
    }
}
