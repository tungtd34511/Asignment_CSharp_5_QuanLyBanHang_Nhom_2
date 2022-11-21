using System.ComponentModel.DataAnnotations;

namespace App.API.Infrastructure.ViewModels.Catalog.Size
{
    public class UpdateSizeRequest
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Tên size không được để trống")]
        public string? Name { get; set; }

        [Required(ErrorMessage = "Mã không được để trống")]
        public string? Code { get; set; }
    }
}
