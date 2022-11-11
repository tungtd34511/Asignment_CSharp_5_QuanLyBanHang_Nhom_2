using App.API.Infrastructure.ViewModels.Catalog.Promotion;
using App.WebApplication.IServices;
using Microsoft.AspNetCore.Mvc;

namespace App.WebApplication.Controllers
{
    public class PromotionController : Controller
    {
        private readonly IPromotionApiClient _promotionApiClient;

        public PromotionController(IPromotionApiClient promotionApiClient)
        {
            _promotionApiClient = promotionApiClient;
        }

        public async Task<IActionResult> Index()
        {
            ViewData["lst"] = await _promotionApiClient.GetAll();

            if (TempData["message"] != null)
            {
                ViewBag.message = TempData["message"];
            }

            return View();
        }

        public async Task<IActionResult> Add(PromotionAddRequest request)
        {
            if (ModelState.IsValid)
            {
                if (await _promotionApiClient.Add(request))
                {
                    TempData["message"] = "Thành công";
                    return RedirectToAction("Index");
                }
            }

            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Delete(int id)
        {
            if (await _promotionApiClient.Delete(id))
            {
                TempData["message"] = "Thành công";
                return RedirectToAction("Index");
            }

            return RedirectToAction("Index");
        }

        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var pro = await _promotionApiClient.GetById(id);

            var request = new PromotionEditRequest()
            {
                Id = pro.Id,
                FromDate = pro.FromDate,
                ToDate = pro.ToDate,
                ApplyForAll = pro.ApplyForAll,
                DiscountAmount = pro.DiscountAmount,
                DiscountPercent = pro.DiscountPercent,
                ProductCategoryIds = pro.ProductCategoryIds,
                ProductIds = pro.ProductIds,
                Name = pro.Name,
            };
            return View(request);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(PromotionEditRequest request)
        {
            if (ModelState.IsValid)
            {
                if (await _promotionApiClient.Edit(request.Id,request))
                {
                    TempData["message"] = "Thành công";
                    return RedirectToAction("Index");
                }
            }

            return RedirectToAction("Index");
        }
    }
}
