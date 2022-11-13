using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace App.WebApplication.Models
{
    public class SlideModel
    {
        public int id { get; set; }

        [Required(ErrorMessage = "Tên không được để trống")]
        public string? Name { set; get; }

        [Required(ErrorMessage = "Mô tả không được để trống")]
        public string? Description { set; get; }

        [Required(ErrorMessage = "Thứ tự không được để trống")]
        public int SortOrder { get; set; }

        [NotMapped]
        [Required(ErrorMessage = "Thứ tự không được để trống")]
        public IFormFile? ImageFile { get; set; }
    }
}
