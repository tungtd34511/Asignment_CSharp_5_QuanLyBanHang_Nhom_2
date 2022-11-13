namespace App.API.Infrastructure.ViewModels.Catalog.Color
{
    public class UpdateColorRequest
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? HexCode { get; set; }
    }
}
