using Data.Entities;
using Data.Enums;

namespace App.API.Infrastructure.ViewModels.Catalog.Oders
{
    public class OderVm
    {
        public int Id { get; set; }
        public DateTime OrderDate { set; get; }
        public Guid UserId { set; get; }
        public string? UserName { set; get; }
        public string? ShipName { set; get; }
        public string? ShipAddress { set; get; }
        public string? ShipEmail { set; get; }
        public string? ShipPhoneNumber { set; get; }
        public OrderStatus Status { set; get; }
        public List<OderDetailVm> OrderDetails { get; set; }
    }
}
