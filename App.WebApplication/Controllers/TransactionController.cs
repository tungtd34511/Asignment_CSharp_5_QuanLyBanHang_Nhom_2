using App.API.Infrastructure.ViewModels.Catalog.Transaction;
using App.WebApplication.IServices;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace App.WebApplication.Controllers
{
    public class TransactionController : Controller
    {
        private readonly ITransactionApiClient _transactionApiClient;

        public TransactionController(ITransactionApiClient transactionApiClient)
        {
            _transactionApiClient = transactionApiClient;
        }

        public async Task<IActionResult> Index()
        {
            ViewData["lst"] = await _transactionApiClient.GetAll();
            if (TempData["Result"] != null)
            {
                ViewBag.message = TempData["Result"];
            }
            return View();
        }
        [Authorize(Roles = "admin,nhanvien")]
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var tran = await _transactionApiClient.GetById(id);

            var request = new TransactionEditRequest()
            {
                Id = id,
                TransactionDate = tran.TransactionDate,
                ExternalTransactionId = tran.ExternalTransactionId,
                Amount = tran.Amount,
                Fee = tran.Fee,
                Result = tran.Result,
                Message = tran.Message,
                Provider = tran.Provider,
                UserId = tran.UserId,
            };

            ViewData["lstuser"] = await _transactionApiClient.GetUser();
            return View(request);
        }
        [Authorize(Roles = "admin,nhanvien")]
        [HttpPost]
        public async Task<IActionResult> Edit(TransactionEditRequest request)
        {
            if (await _transactionApiClient.Edit(request.Id, request))
            {
                TempData["Result"] = "thanh cong";
                return RedirectToAction("Index");
            }

            return RedirectToAction("Index");
        }
        [Authorize(Roles = "admin,nhanvien")]
        public async Task<IActionResult> Delete(int id)
        {
            if (await _transactionApiClient.Delete(id))
            {
                TempData["Result"] = "thanh cong";
                return RedirectToAction("Index");
            }

            return RedirectToAction("Index");
        }
    }
}
