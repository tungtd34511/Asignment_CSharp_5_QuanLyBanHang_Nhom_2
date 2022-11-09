using Data.Enums;

namespace App.API.Infrastructure.ViewModels.Catalog.Oders
{
    public class DeleteCartRequest
    {
        public int orderId { get;set; }

        public OrderStatus status { get;set; }
    }
}
