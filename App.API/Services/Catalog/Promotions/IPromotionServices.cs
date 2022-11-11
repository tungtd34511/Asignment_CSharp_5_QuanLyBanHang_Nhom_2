using App.API.Infrastructure.ViewModels.Catalog.Promotion;
using Data.Entities;

namespace App.API.Services.Catalog.Promotions
{
    public interface IPromotionServices
    {
        public Task<List<Promotion>> GetAll();

        public Task<Promotion> GetById(int id);

        public Task<bool> Add(PromotionAddRequest promotionAddRequest);

        public Task<bool> Edit(int id,PromotionEditRequest promotionEditRequest);

        public Task<bool> Delete(int id);
    }
}
