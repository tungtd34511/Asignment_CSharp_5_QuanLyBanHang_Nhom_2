
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace App.WebApplication.Models
{
    public class NavigationViewModel
    {
        public List<SelectListItem>? Languages { get; set; }

        public string? CurrentLanguageId { get; set; }

        public string? ReturnUrl { set; get; }
    }
}