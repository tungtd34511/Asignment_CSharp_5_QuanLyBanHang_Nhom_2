using System.ComponentModel.DataAnnotations;

namespace App.API.Infrastructure.ViewModels.Utilities.Slides
{
    public class SlideEditRequest
    {
        public int id { get; set; }

        [Required(ErrorMessage = "Tên không được để trống")]
        public string? Name { set; get; }

        [Required(ErrorMessage = "Mô tả không đưuọc để trống")]
        public string? Description { set; get; }

        public string? Url { set; get; }

        public string? Image { get; set; }

        [Required(ErrorMessage = "Thứ tự không đưuọc để trống")]
        public int SortOrder { get; set; }
    }
}
