using System;
using System.Collections.Generic;
using System.Text;

namespace Data.Entities
{
    public class OrderDetail
    {
        public int OrderId { set; get; }
        public int ProductVariationId { set; get; }
        public int Quantity { set; get; }
        public decimal Price { set; get; }
        public virtual Order? Order { get; set; }
        public virtual ProductVariation? ProductVariation { get; set; }

    }
}
