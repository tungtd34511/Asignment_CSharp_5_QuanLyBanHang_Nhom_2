using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entities
{
    public class ProductVariation
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public virtual Product Product { get; set; }
        public int ColorId { get; set; }
        public virtual Color Color { get; set; }
        public int SizeId { get; set; }
        public int Stock { set; get; }
        public virtual Size Size { get; set; }
        public virtual List<OrderDetail> OrderDetails { get; set; }
        public virtual List<Cart> Carts { get; set; }
    }
}
