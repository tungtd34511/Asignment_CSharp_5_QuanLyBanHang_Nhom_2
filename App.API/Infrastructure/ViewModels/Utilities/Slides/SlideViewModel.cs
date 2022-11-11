using System;
using System.Collections.Generic;
using System.Text;

namespace App.API.Infrastructure.ViewModels.Utilities.Slides
{
    public class SlideViewModel
    {
        public int id { get; set; }
        public string Name { set; get; }
        public string Description { set; get; }
        public string Image { get; set; }
        public int SortOrder { get; set; }
    }
}