
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using App.API.Infrastructure.ViewModels.Common;
using App.API.Infrastructure.ViewModels.System.Languages;

namespace App.API.Services.System.Languages
{
    public interface ILanguageService
    {
        Task<ApiResult<List<LanguageVm>>> GetAll();
    }
}