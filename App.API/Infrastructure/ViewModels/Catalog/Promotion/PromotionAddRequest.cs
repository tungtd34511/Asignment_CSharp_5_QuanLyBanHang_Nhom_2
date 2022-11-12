using Data.Enums;
using System.ComponentModel.DataAnnotations;

namespace App.API.Infrastructure.ViewModels.Catalog.Promotion
{
    public class PromotionAddRequest
    {
        [Required(ErrorMessage = "Ngày bắt đầu không được để trống")]
        public DateTime FromDate { set; get; }

        [Required(ErrorMessage = "Ngày kết thúc không được để trống")]
        public DateTime ToDate { set; get; }

        public bool ApplyForAll { set; get; }

        [Required(ErrorMessage = "Phần trăm chiết khấu không được để trống")]
        public int? DiscountPercent { set; get; }

        [Required(ErrorMessage = "Giam giá không được để trống")]
        public decimal? DiscountAmount { set; get; }

        [Required(ErrorMessage = "Sản phẩm không được để trống")]
        public string ProductIds { set; get; }

        [Required(ErrorMessage = "danh mục sản phẩm không được để trống")]
        public string ProductCategoryIds { set; get; }

        [Required(ErrorMessage = "Tên không được để trống")]
        public string Name { set; get; }
    }
}
