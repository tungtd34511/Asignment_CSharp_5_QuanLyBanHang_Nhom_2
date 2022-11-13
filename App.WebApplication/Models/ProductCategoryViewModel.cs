
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App.API.Infrastructure.ViewModels.Catalog.Categories;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.Common;

namespace App.WebApplication.Models
{
    public class ProductCategoryViewModel
    {
        public CategoryVm? Category { get; set; }

        public PagedResult<ProductVm>? Products { get; set; }
    }
}