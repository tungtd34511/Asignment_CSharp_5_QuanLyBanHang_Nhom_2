using App.API.Infrastructure.Utilities.Exceptions;
using Data.DbContext;
using Data.Entities;
using Microsoft.EntityFrameworkCore;
using System.Drawing;

namespace App.API.Services.Catalog.Carts
{
    public class CartService : ICartServie
    {
        private readonly QLBHContext _context;

        public CartService(QLBHContext context)
        {
            _context = context;
        }
        public async Task<int> AddToCart(Cart cart)
        {
            _context.Add(cart);
            await _context.SaveChangesAsync();
            return cart.Id;
        }

        public async Task<bool> DeleteById(Guid id)
        {
            var cart = await _context.Carts.FindAsync(id);
            if (cart == null) throw new EShopException($"Cannot find a cart: {id}");
            _context.Carts.Remove(cart);
            return await _context.SaveChangesAsync() > 0;
        }

        public async Task<List<Cart>> GetByUser(Guid userId)
        {
            var cart = await _context.Carts.Where(c => c.UserId == userId).ToListAsync();
            if (cart == null) throw new EShopException($"Cannot find a cart");
            return cart;
        }
        public async Task<bool> DeleteByUser(Guid userId)
        {
            var cart = await _context.Carts.Where(c => c.UserId == userId).ToListAsync();
            if (cart == null) throw new EShopException($"Cannot find a cart");
            foreach (var item in cart)
            {
                _context.Carts.Remove(item);
            }
            return await _context.SaveChangesAsync() > 0;
        }
        public async Task<int> UpdateCart(Cart cart)
        {
            _context.Update(cart);
            await _context.SaveChangesAsync();
            return cart.Id;
        }
        public async Task<bool> AsyncOnLogin(List<Cart> cart)
        {
            try
            {
                foreach (var item in cart)
                {
                    var result = _context.Carts.FirstOrDefault(c => c.UserId == item.UserId && c.ProductVariationId == item.ProductVariationId);
                    if (result != null)
                    {
                        result.Quantity += item.Quantity;
                        _context.Carts.Update(result);
                    }
                    else
                    {
                        _context.Carts.Update(item);
                    }
                }
                await _context.SaveChangesAsync();
                return true;
            }

            catch
            {
                return false;
            }
        }
    }
}
