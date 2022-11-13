using Data.Entities;
using Data.Enums;
using System;
using System.Collections.Generic;
using System.Text;

namespace App.API.Infrastructure.ViewModels.Sales
{
    public class CheckoutRequest
    {
        public Guid UserId { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public int OderId { set; get; }
        public DateTime OrderDate { set; get; }
        public string? ShipName { set; get; }
        public string? ShipAddress { set; get; }
        public string? ShipEmail { set; get; }
        public string? ShipPhoneNumber { set; get; }
        public OrderStatus Status { set; get; }
        public List<OderDetailViewModel> OrderDetails { set; get; } = new List<OderDetailViewModel>();
    }
}