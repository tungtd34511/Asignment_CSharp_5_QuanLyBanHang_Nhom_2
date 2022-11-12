using App.API.Infrastructure.ViewModels.Catalog.Promotion;
using Data.Entities;

namespace App.WebApplication.IServices
{
    public interface IPromotionApiClient
    {
        public Task<List<Promotion>> GetAll();

        public Task<Promotion> GetById(int id);

        public Task<bool> Add(PromotionAddRequest request);

        public Task<bool> Edit(int id,PromotionEditRequest request);

        public Task<bool> Delete(int id);
    }
}
