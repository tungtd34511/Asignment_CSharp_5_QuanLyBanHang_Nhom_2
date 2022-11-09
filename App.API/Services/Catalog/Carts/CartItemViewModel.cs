namespace App.API.Services.Catalog.Carts
{
    public class CartItemViewModel
    {
        public int? CartId { get; set; }
        public int? PVId { get; set; }
        public int ProductId { get; set; }
        public int ColorId { get; set; }
        public int SizeId { get; set; }
        public string ColorName { get; set; }
        public string SizeCode { get; set; }
        public int Quantity { get; set; }

        public string Description { get; set; }

        public string Name { get; set; }

        public string Image { get; set; }

        public decimal Price { get; set; }

        public DateTime? DateCreated { get; set; }
    }
}
