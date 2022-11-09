using Data.Entities;

namespace App.API.Services.Catalog.Carts
{
    public interface ICartServie
    {
        Task<List<Cart>> GetByUser(Guid userId);
        Task<int> AddToCart(Cart cart);
        Task<bool> DeleteById(Guid id);
        Task<int> UpdateCart(Cart cart);
        Task<bool> AsyncOnLogin(List<Cart> cart);
    }
}
