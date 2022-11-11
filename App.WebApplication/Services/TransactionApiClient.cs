using App.API.Infrastructure.ViewModels.Catalog.Transaction;
using App.API.Infrastructure.ViewModels.System.Users;
using App.WebApplication.IServices;
using Data.Entities;
using MVC.Helper;

namespace App.WebApplication.Services
{
    public class TransactionApiClient : ITransactionApiClient
    {
        CallApi _helper;

        public TransactionApiClient()
        {
            _helper = new CallApi();
        }

        public async Task<bool> Add(TransactionAddRequest request)
        {
            var res = await _helper.Initial().PostAsJsonAsync("api/Transactions",request);
            if (res.IsSuccessStatusCode) return true;
            return false;
        }

        public async Task<bool> Delete(int id)
        {
            var res = await _helper.Initial().DeleteAsync("api/Transactions/" + id);
            if (res.IsSuccessStatusCode) return true;
            return false;
        }

        public async Task<bool> Edit(int id,TransactionEditRequest request)
        {
            var res = await _helper.Initial().PutAsJsonAsync("api/Transactions/" + id, request);
            if (res.IsSuccessStatusCode) return true;
            return false;
        }

        public async Task<List<TransactionViewModel>> GetAll()
        {
            return await _helper.Initial().GetFromJsonAsync <List<TransactionViewModel>>("api/Transactions");
        }

        public async Task<Transaction> GetById(int id)
        {
            return await _helper.Initial().GetFromJsonAsync<Transaction>("api/Transactions/" + id);
        }

        public async Task<List<UserViewModel>> GetUser()
        {
            return await _helper.Initial().GetFromJsonAsync<List<UserViewModel>>("api/Users");
        }
    }
}
