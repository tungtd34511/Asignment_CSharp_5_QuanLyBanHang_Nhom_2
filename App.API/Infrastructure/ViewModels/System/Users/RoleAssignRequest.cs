
using System;
using System.Collections.Generic;
using System.Text;
using App.API.Infrastructure.ViewModels.Common;

namespace App.API.Infrastructure.ViewModels.System.Users
{
    public class RoleAssignRequest
    {
        public Guid Id { get; set; }
        public List<SelectItem> Roles { get; set; } = new List<SelectItem>();
    }
}