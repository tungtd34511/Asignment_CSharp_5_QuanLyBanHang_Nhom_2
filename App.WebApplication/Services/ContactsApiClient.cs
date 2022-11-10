using App.API.Infrastructure.ViewModels.Catalog.Contacts;
using App.WebApplication.IServices;
using Data.Entities;
using Microsoft.AspNetCore.Mvc;
using MVC.Helper;

namespace App.WebApplication.Services
{
    public class ContactsApiClient : IContactApiClien
    {
        CallApi _Helper;

        public ContactsApiClient()
        {
            _Helper = new CallApi();
        }

        public async Task<bool> Add(ContactAddRequest contacts)
        {
            var res = await _Helper.Initial().PostAsJsonAsync("api/Contacts", contacts);

            if (res.IsSuccessStatusCode) return true;
            return false;
        }

        public async Task<bool> Delete(int id)
        {
            var res = await _Helper.Initial().DeleteAsync("api/Contacts/" + id);

            if (res.IsSuccessStatusCode) return true;
            return false;
        }

        public async Task<bool> Edit(int id, ContactEditRequest contacts)
        {
            var res = await _Helper.Initial().PutAsJsonAsync("api/Contacts/" + id, contacts);

            if (res.IsSuccessStatusCode) return true;
            return false;
        }

        public async Task<List<Contact>> GetAll()
        {
            List<Contact> contacts = new List<Contact>();
            contacts = await _Helper.Initial().GetFromJsonAsync<List<Contact>>("api/Contacts");
            return contacts;
        }

        public async Task<Contact> GetById(int id)
        {
            return await _Helper.Initial().GetFromJsonAsync<Contact>("api/Contacts/" + id);
        }
    }
}
