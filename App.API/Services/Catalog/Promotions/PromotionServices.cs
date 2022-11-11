using App.API.Infrastructure.ViewModels.Catalog.Promotion;
using Data.DbContext;
using Data.Entities;

namespace App.API.Services.Catalog.Promotions
{
    public class PromotionServices : IPromotionServices
    {
        QLBHContext _db;
        public PromotionServices(QLBHContext db)
        {
            _db = db;
        }

        public async Task<bool> Add(PromotionAddRequest promotionAddRequest)
        {
            if (promotionAddRequest == null) return false;

            var pro = new Promotion()
            {
                FromDate = promotionAddRequest.FromDate,
                ToDate = promotionAddRequest.ToDate,
                ApplyForAll = promotionAddRequest.ApplyForAll,
                DiscountAmount = promotionAddRequest.DiscountAmount,
                DiscountPercent = promotionAddRequest.DiscountPercent,
                ProductCategoryIds = promotionAddRequest.ProductCategoryIds,
                ProductIds = promotionAddRequest.ProductIds,
                Name = promotionAddRequest.Name,
            };

            try
            {
                _db.Promotions.Add(pro);
                _db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }  
        }

        public async Task<bool> Delete(int id)
        {
            var pro = _db.Promotions.FirstOrDefault(c => c.Id == id);

            if (pro == null) return false;

            try
            {
                _db.Promotions.Remove(pro);
                _db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }   
        }

        public async Task<bool> Edit(int id,PromotionEditRequest promotionEditRequest)
        {
            if (promotionEditRequest == null) return false;

            var pro = new Promotion()
            {
                Id = id,
                FromDate = promotionEditRequest.FromDate,
                ToDate = promotionEditRequest.ToDate,
                ApplyForAll = promotionEditRequest.ApplyForAll,
                DiscountAmount = promotionEditRequest.DiscountAmount,
                DiscountPercent = promotionEditRequest.DiscountPercent,
                ProductCategoryIds = promotionEditRequest.ProductCategoryIds,
                ProductIds = promotionEditRequest.ProductIds,
                Name = promotionEditRequest.Name,
            };

            try
            {
                _db.Promotions.Update(pro);
                _db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<List<Promotion>> GetAll()
        {
            return _db.Promotions.ToList();
        }

        public async Task<Promotion> GetById(int id)
        {
            return _db.Promotions.FirstOrDefault(c => c.Id == id);
        }
    }
}
