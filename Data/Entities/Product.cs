using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Data.Entities
{
    public class Product
    {
        public int Id { set; get; }
        public decimal Price { set; get; }
        public decimal OriginalPrice { set; get; }
        public int ViewCount { set; get; }
        public DateTime DateCreated { set; get; }
        public bool? IsFeatured { get; set; }
        public virtual List<ProductInCategory>? ProductInCategories { get; set; }
        public virtual List<ProductTranslation>? ProductTranslations { get; set; }
        public virtual List<ProductImage>? ProductImages { get; set; }
        public virtual List<ProductVariation>? ProductVariations { get; set; }
    }
}