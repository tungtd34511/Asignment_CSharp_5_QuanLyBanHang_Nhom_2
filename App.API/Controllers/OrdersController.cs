using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App.API.Infrastructure.ViewModels.Catalog.Oders;
using App.API.Infrastructure.ViewModels.Catalog.ProductImages;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Services.Catalog.Oders;
using Data.Enums;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace App.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        private readonly IOderService _orderService;

        public OrdersController(
            IOderService productService)
        {
            _orderService = productService;
        }

        [HttpGet("paging")]
        public async Task<IActionResult> GetAllPaging([FromQuery] GetOrdersRequest request)
        {
            var products = await _orderService.GetAllPaging(request);
            return Ok(products);
        }

        [HttpGet("{orderId}/{languageId}")]
        public async Task<IActionResult> GetById(int orderId, string languageId)
        {
            var product = await _orderService.GetById(orderId, languageId);
            if (product == null)
                return BadRequest("Cannot find order");
            return Ok(product);
        }


        [HttpPost]
        [Authorize]
        public async Task<IActionResult> Create([FromForm] CreateOderReqquest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var orderId = await _orderService.Create(request);
            if (orderId == 0)
                return BadRequest();
            return Ok();
        }

        [HttpPut]
        [Authorize]
        public async Task<IActionResult> Update([FromForm] UpdateOderRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var affectedResult = await _orderService.Update(request);
            if (affectedResult == 0)
                return BadRequest();
            return Ok();
        }

        [HttpDelete("{orderId}")]
        [Authorize]
        public async Task<IActionResult> Delete(int orderId)
        {
            var affectedResult = await _orderService.Delete(orderId);
            if (affectedResult == 0)
                return BadRequest();
            return Ok();
        }
        [HttpPut("update-status")] 
        [Authorize]
        public async Task<IActionResult> UpdateStatus(UpdateOrderStatusRequest request)
        {
            var isSuccessful = await _orderService.UpdateStatus(request);
            if (isSuccessful)
                return Ok();

            return BadRequest();
        }
    }
}
