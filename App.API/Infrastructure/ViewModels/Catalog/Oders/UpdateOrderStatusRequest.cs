using Data.Enums;

namespace App.API.Infrastructure.ViewModels.Catalog.Oders
{
    public class UpdateOrderStatusRequest   
    {
        public int orderId { get;set; }

        public OrderStatus status { get;set; }
    }
}
