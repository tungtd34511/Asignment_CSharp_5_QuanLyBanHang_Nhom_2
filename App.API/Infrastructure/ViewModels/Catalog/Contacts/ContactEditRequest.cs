using System.ComponentModel.DataAnnotations;

namespace App.API.Infrastructure.ViewModels.Catalog.Contacts
{
    public class ContactEditRequest
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Không được để trống tên")]
        public string? Name { set; get; }

        [Required(ErrorMessage = "Không được để trống email")]
        public string? Email { set; get; }

        [Required(ErrorMessage = "Không được để trống số điện thoại")]
        public string? PhoneNumber { set; get; }

        [Required(ErrorMessage = "Không được để trống tin nhắn")]
        public string? Message { set; get; }
    }
}
