using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using App.API.Infrastructure.ViewModels.System.Roles;

namespace App.API.Services.System.Roles
{
    public interface IRoleService
    {
        Task<List<RoleVm>> GetAll();
    }
}