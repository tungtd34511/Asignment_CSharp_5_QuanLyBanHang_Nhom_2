using App.API.Infrastructure.Utilities.Constants;
using Data.Entities;
using Data.Enums;

namespace App.API.Infrastructure.ViewModels.Catalog.Oders
{
    public class CreateOderReqquest
    {
        public DateTime OrderDate { set; get; }
        public Guid? UserId { get; set; }
        public string? FirstName { get; set; } 
        public string? LastName { get; set; }
        public string? ShipName { set; get; }
        public string? ShipAddress { set; get; } 
        public string? ShipEmail { set; get; } 
        public string? ShipPhoneNumber { set; get; } 
        public OrderStatus Status { set; get; }

        public List<OrderDetail>? OrderDetails { get; set; }
    }
}
