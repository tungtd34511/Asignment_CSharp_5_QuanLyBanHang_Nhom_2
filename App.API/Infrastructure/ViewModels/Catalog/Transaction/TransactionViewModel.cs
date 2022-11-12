using Data.Entities;
using Data.Enums;

namespace App.API.Infrastructure.ViewModels.Catalog.Transaction
{
    public class TransactionViewModel
    {
        public int Id { get; set; }
        public DateTime TransactionDate { set; get; }
        public string ExternalTransactionId { set; get; }
        public decimal Amount { set; get; }
        public decimal Fee { set; get; }
        public string Result { set; get; }
        public string Message { set; get; }
        public TransactionStatus Status { set; get; }
        public string Provider { set; get; }
        public string NameUser { get; set; }
    }
}
