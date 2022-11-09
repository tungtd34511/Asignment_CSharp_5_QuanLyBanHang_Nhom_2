using App.API.Infrastructure.ViewModels.Catalog.Carts;
using App.API.Infrastructure.ViewModels.Catalog.Oders;
using App.API.Services.Catalog.Carts;
using Data.Entities;
using Microsoft.AspNetCore.Mvc;

namespace App.WebApplication.IServices
{
    public interface ICartApiClient
    {
        Task<List<CartItemViewModel>> GetByUser(string userId);
        Task<bool> AddToCart(AddToCartRequest request);
        Task<bool> Update(UpdateCartRequest color);
        Task<bool> DeleteCart(string userid);
        Task<bool> Checkout(CreateOderReqquest request);
        Task<bool> AsyncCart(List<CartItemViewModel> request);
    }
}
