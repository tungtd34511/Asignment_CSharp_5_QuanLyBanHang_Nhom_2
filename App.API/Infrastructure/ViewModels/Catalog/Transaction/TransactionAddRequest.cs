using Data.Enums;

namespace App.API.Infrastructure.ViewModels.Catalog.Transaction
{
    public class TransactionAddRequest
    {
        public DateTime TransactionDate { set; get; }

        public string ExternalTransactionId { set; get; }

        public decimal Amount { set; get; }

        public decimal Fee { set; get; }

        public string Result { set; get; }

        public string Message { set; get; }

        public string Provider { set; get; }

        public Guid UserId { get; set; }
    }
}
