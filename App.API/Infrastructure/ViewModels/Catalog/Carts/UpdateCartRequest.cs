using Data.Entities;
using Data.Enums;

namespace App.API.Infrastructure.ViewModels.Catalog.Carts
{
    public class UpdateCartRequest
    {
        public int Id { set; get; }
        public int ProductVariationId { set; get; }
        public int Quantity { set; get; }
        public decimal Price { set; get; }
        public Guid UserId { get; set; }
        public DateTime DateCreated { get; set; }

    }
}
