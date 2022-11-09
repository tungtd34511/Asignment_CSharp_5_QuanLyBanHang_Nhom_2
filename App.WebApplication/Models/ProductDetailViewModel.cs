
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App.API.Infrastructure.ViewModels.Catalog.Categories;
using App.API.Infrastructure.ViewModels.Catalog.ProductImages;
using App.API.Infrastructure.ViewModels.Catalog.Products;

namespace App.WebApplication.Models
{
    public class ProductDetailViewModel
    {
        public CategoryVm Category { get; set; }

        public ProductVm Product { get; set; }

        public List<ProductVm> RelatedProducts { get; set; }

        public List<ProductImageViewModel> ProductImages { get; set; }
    }
}