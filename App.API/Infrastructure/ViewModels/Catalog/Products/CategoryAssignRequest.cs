using System;
using System.Collections.Generic;
using System.Text;
using App.API.Infrastructure.ViewModels.Common;

namespace App.API.Infrastructure.ViewModels.Catalog.Products
{
    public class CategoryAssignRequest
    {
        public int Id { get; set; }
        public List<SelectItem> Categories { get; set; } = new List<SelectItem>();
    }
}