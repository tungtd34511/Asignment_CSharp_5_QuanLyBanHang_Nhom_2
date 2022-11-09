
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App.API.Infrastructure.ViewModels.Common;
using App.API.Infrastructure.ViewModels.System.Roles;

namespace App.WebApplication.IServices
{
    public interface IRoleApiClient
    {
        Task<ApiResult<List<RoleVm>>> GetAll();
    }
}