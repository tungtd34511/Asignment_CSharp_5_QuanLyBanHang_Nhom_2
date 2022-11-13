using App.API.Infrastructure.Utilities.Constants;
using App.API.Infrastructure.ViewModels.Catalog.Oders;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.Common;
using App.WebApplication.IServices;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Net.WebSockets;

namespace App.WebApplication.Controllers
{
    public class OrderController : Controller
    {
        private readonly IConfiguration _configuration;

        private readonly IOrderApiClient _orderApiClient;

        public OrderController(IConfiguration configuration, IOrderApiClient orderApiClient)
        {
            _configuration = configuration;
            _orderApiClient = orderApiClient;
        }
        [Authorize(Roles = "admin,nhanvien")]
        public async Task<IActionResult> Index(string? keyword, int? categoryId, int pageIndex = 1, int pageSize = 10)
        {
            var request = new GetOrdersRequest()
            {
                Keyword = keyword,
                PageIndex = pageIndex,
                PageSize = pageSize,
                LanguageId = "vi"
            };

            var data = await _orderApiClient.GetPagings(request);
            ViewBag.Keyword = keyword;
            if (TempData["result"] != null)
            {
                ViewBag.SuccessMsg = TempData["result"];
            }
            return View(data);
        }
        [Authorize(Roles = "admin,nhanvien")]
        public async Task<IActionResult> Detail(int id)
        {
            var data = await _orderApiClient.GetById(id,"vi");
            if (data == null)
                return BadRequest("Not Found!");
            return View(data);
        }
        [Authorize(Roles = "admin,nhanvien")]
        [HttpGet]
        public async Task<IActionResult> StatusAssign(int id)
        {
            var data = await _orderApiClient.GetById(id, "vi");
            if (data == null)
                return BadRequest("Not Found!");
            return View(new UpdateOrderStatusRequest()
            {
                orderId = data.Id,
                status=data.Status
            });
        }
        [Authorize(Roles = "admin,nhanvien")]
        [HttpPost]
        public async Task<IActionResult> StatusAssign(UpdateOrderStatusRequest request)
        {
            if (!ModelState.IsValid)
                return View(request);

            var result = await _orderApiClient.UpdateStatus(request);

            if (result)
            {
                TempData["result"] = "Cập nhật trạng thái hóa đơn thành công";
                return RedirectToAction("Index");
            }
            return View(request);
        }
    }
}
