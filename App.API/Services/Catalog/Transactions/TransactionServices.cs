using App.API.Infrastructure.ViewModels.Catalog.Transaction;
using App.API.Infrastructure.ViewModels.System.Users;
using Data.DbContext;
using Data.Entities;

namespace App.API.Services.Catalog.Transactions
{
    public class TransactionServices : ITransactionServices
    {
        private readonly QLBHContext _db;

        public TransactionServices(QLBHContext db)
        {
            _db = db;
        }

        public async Task<bool> Add(TransactionAddRequest request)
        {
            if (request == null) return false;

            var tran = new Transaction()
            {
                TransactionDate = request.TransactionDate,
                ExternalTransactionId = request.ExternalTransactionId,
                Amount = request.Amount,
                Fee = request.Fee,
                Result = request.Result,
                Message = request.Message,
                Status = Data.Enums.TransactionStatus.Success,
                Provider = request.Provider,
                UserId = request.UserId
            };

            try
            {
                _db.Transactions.Add(tran);
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
            var tran = _db.Transactions.FirstOrDefault(c => c.Id == id);

            if (tran == null) return false;

            try
            {
                _db.Transactions.Remove(tran);
                _db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<bool> Edit(int id,TransactionEditRequest request)
        {
            if (request == null) return false;

            var tran = new Transaction()
            {
                Id = id,
                TransactionDate = request.TransactionDate,
                ExternalTransactionId = request.ExternalTransactionId,
                Amount = request.Amount,
                Fee = request.Fee,
                Result = request.Result,
                Message = request.Message,
                Status = Data.Enums.TransactionStatus.Success,
                Provider = request.Provider,
                UserId = request.UserId
            };

            try
            {
                _db.Transactions.Update(tran);
                _db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<List<TransactionViewModel>> GetAll()
        {
            var trans = (from a in _db.Transactions
                        join b in _db.Users on a.UserId equals b.Id
                        select new TransactionViewModel()
                        {
                            Id = a.Id,
                            TransactionDate = a.TransactionDate,
                            ExternalTransactionId = a.ExternalTransactionId,
                            Amount = a.Amount,
                            Fee = a.Fee,
                            Result = a.Result,
                            Message = a.Message,
                            Status = a.Status,
                            Provider = a.Provider,
                            NameUser = b.FirstName,
                        }).ToList();

            return trans;             
        }

        public async Task<Transaction> GetById(int Id)
        {
            return _db.Transactions.FirstOrDefault(c => c.Id == Id);
        }
    }
}
