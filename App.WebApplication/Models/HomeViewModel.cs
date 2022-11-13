
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.Utilities.Slides;
using Data.Entities;

namespace App.WebApplication.Models
{
    public class HomeViewModel
    {
        public List<Slide>? Slides { get; set; }

        public List<ProductVm>? FeaturedProducts { get; set; }

        public List<ProductVm>? LatestProducts { get; set; }
    }
}