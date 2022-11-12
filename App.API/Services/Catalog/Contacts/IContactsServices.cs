using App.API.Infrastructure.ViewModels.Catalog.Contacts;
using Data.Entities;

namespace App.API.Services.Catalog.Contacts
{
    public interface IContactsServices
    {
        public Task<List<Contact>>  GetAll();

        public Task<bool> Add(ContactAddRequest contacts);

        public Task<bool> Edit(Contact contacts);

        public Task<bool> Delete(int id);

        public Task<Contact> GetById(int id);
    }
}
