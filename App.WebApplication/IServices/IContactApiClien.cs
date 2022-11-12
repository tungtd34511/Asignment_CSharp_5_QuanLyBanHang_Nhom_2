using App.API.Infrastructure.ViewModels.Catalog.Contacts;
using Data.Entities;
using Microsoft.AspNetCore.Mvc;

namespace App.WebApplication.IServices
{
    public interface IContactApiClien
    {
        public Task<List<Contact>> GetAll();

        public Task<Contact> GetById(int id);

        public Task<bool> Add(ContactAddRequest contacts);

        public Task<bool> Delete(int id);

        public Task<bool> Edit(int id,ContactEditRequest contacts);
    }
}
