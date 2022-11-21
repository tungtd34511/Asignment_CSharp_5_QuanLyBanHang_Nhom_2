using System.Globalization;
using FluentValidation.AspNetCore;
using LazZiya.ExpressLocalization;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Localization;
using App.API.Infrastructure.ViewModels.System.Users;
using App.WebApplication.IServices;
using App.WebApplication.LocalizationResources;
using App.WebApplication.Services;
using App.API.Services.Catalog.Carts;
using App.API.Services.Catalog.Oders;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddMvc();
builder.Services.AddHttpClient();
builder.Services.AddControllersWithViews();

var mvcBuilder = builder.Services.AddRazorPages();
if (builder.Environment.IsDevelopment())
{
    mvcBuilder.AddRazorRuntimeCompilation();
}
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30);
});
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(options =>
    {
        options.LoginPath = "/Login";
        options.AccessDeniedPath = "/User/Forbidden/";
    });
//AdminServices

builder.Services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
builder.Services.AddTransient<IUserApiClient, UserApiClient>();
builder.Services.AddTransient<IRoleApiClient, RoleApiClient>();
builder.Services.AddTransient<ISizeApiClient, SizeApiClient>();
builder.Services.AddTransient<IColorApiClient, ColorApiClient>();
builder.Services.AddTransient<ILanguageApiClient, LanguageApiClient>();
builder.Services.AddTransient<IProductApiClient, ProductApiClient>();
builder.Services.AddTransient<ISlideApiClient, SlideApiClient>();
builder.Services.AddTransient<ICategoryApiClient, CategoryApiClient>();
builder.Services.AddTransient<IProductVariationApiClient, ProductVariationApiClient>();
builder.Services.AddTransient<ICartApiClient, CartApiClient>();
builder.Services.AddTransient<IContactApiClien, ContactsApiClient>();
builder.Services.AddTransient<IPromotionApiClient, PromotionApiClient>();
builder.Services.AddTransient<ITransactionApiClient, TransactionApiClient>();
builder.Services.AddTransient<IOrderApiClient, OrderApiClient>();
// WebSevice
var cultures = new[]
{
                new CultureInfo("en"),
                new CultureInfo("vi"),
};

builder.Services.AddControllersWithViews()
    .AddFluentValidation(fv => fv.RegisterValidatorsFromAssemblyContaining<LoginRequestValidator>())
    .AddExpressLocalization<ExpressLocalizationResource, ViewLocalizationResource>(ops =>
    {

        ops.UseAllCultureProviders = false;
        ops.ResourcesPath = "LocalizationResources";
        ops.RequestLocalizationOptions = o =>
        {
            o.SupportedCultures = cultures;
            o.SupportedUICultures = cultures;
            o.DefaultRequestCulture = new RequestCulture("vi");
        };
    });
    

//
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
    app.UseDeveloperExceptionPage();
}
else
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    //app.UseHsts();
}

app.UseStaticFiles();
app.UseAuthentication();

app.UseRouting();

app.UseAuthorization();
app.UseSession();
app.UseRequestLocalization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
