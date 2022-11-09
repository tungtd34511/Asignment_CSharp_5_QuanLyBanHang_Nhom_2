namespace App.API.Infrastructure.ViewModels.Catalog.Carts
{
    public class AddToCartRequest
    {
        public int ProductId { get; set; }
        public int ColorId { get; set; }
        public int  SizeId { get; set; }
        public int Stock { get; set; }
        public Guid? UserId { get; set; }
        public decimal Price { get; set; }
    }
}
