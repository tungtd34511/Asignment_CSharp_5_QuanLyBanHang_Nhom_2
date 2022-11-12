using App.API.Infrastructure.ViewModels.Catalog.Transaction;
using App.API.Infrastructure.ViewModels.System.Users;
using App.API.Services.Catalog.Transactions;
using Data.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace App.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TransactionsController : ControllerBase
    {
        private readonly ITransactionServices _transactionServices;

        public TransactionsController(ITransactionServices transactionServices)
        {
            _transactionServices = transactionServices;
        }

        [HttpGet]
        public async Task<List<TransactionViewModel>> GetAll()
        {
            return await _transactionServices.GetAll();
        }

        [HttpGet("{id}")]
        public async Task<Transaction> GetById(int id)
        {
            return await _transactionServices.GetById(id);
        }

        [HttpPost]
        public async Task<IActionResult> Add(TransactionAddRequest request)
        {
            if (await _transactionServices.Add(request)) return Ok(request);
            return BadRequest();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Edit(int id,TransactionEditRequest request)
        {
            if (await _transactionServices.Edit(id,request)) return Ok(request);
            return BadRequest();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            if (await _transactionServices.Delete(id)) return Ok();
            return BadRequest();
        }
    }
}
