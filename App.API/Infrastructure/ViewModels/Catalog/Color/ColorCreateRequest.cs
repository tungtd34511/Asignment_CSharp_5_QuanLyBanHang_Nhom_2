using System.ComponentModel.DataAnnotations;

namespace App.API.Infrastructure.ViewModels.Catalog.Color
{
    public class ColorCreateRequest
    {
        [Required(ErrorMessage = "Tên không được để trống")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Hexcode không được để trống")]
        public string HexCode { get; set; }
    }
}
