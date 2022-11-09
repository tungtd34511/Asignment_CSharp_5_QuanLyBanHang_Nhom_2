﻿using System;
using System.Collections.Generic;
using System.Text;
using Data.Enums;

namespace Data.Entities
{
   public class Order
    {
        public int Id { set; get; }
        public DateTime OrderDate { set; get; }
        public Guid UserId { set; get; }
        public string ShipName { set; get; }
        public string ShipAddress { set; get; }
        public string ShipEmail { set; get; }
        public string ShipPhoneNumber { set; get; }
        public OrderStatus Status { set; get; }

        public virtual List<OrderDetail> OrderDetails { get; set; }

        public virtual AppUser AppUser { get; set; }


    }
}
