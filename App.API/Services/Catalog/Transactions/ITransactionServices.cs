using App.API.Infrastructure.ViewModels.Catalog.Transaction;
using App.API.Infrastructure.ViewModels.System.Users;
using Data.Entities;

namespace App.API.Services.Catalog.Transactions
{
    public interface ITransactionServices
    {
        public Task<List<TransactionViewModel>> GetAll();

        public Task<Transaction> GetById(int Id);

        public Task<bool> Add(TransactionAddRequest request);

        public Task<bool> Edit(int id,TransactionEditRequest request);

        public Task<bool> Delete(int id);
    }
}
