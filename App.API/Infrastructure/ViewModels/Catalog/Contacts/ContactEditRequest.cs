using System.ComponentModel.DataAnnotations;

namespace App.API.Infrastructure.ViewModels.Catalog.Contacts
{
    public class ContactEditRequest
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Không được để trống tên")]
        public string Name { set; get; }

        [Required(ErrorMessage = "Không được để trống email")]
        [RegularExpression("^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$",ErrorMessage = "Email sai định dạng")]
        public string Email { set; get; }

        [Required(ErrorMessage = "Không được để trống số điện thoại")]
        [RegularExpression("^0-9", ErrorMessage = "Số điện thoại không được nhập chữ")]
        public string PhoneNumber { set; get; }

        [Required(ErrorMessage = "Không được để trống tin nhắn")]
        public string Message { set; get; }
    }
}
