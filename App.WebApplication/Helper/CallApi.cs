namespace MVC.Helper
{
    public class CallApi
    {
        public HttpClient Initial()
        {
            var client = new HttpClient();
            client.BaseAddress = new Uri("https://localhost:7100");
            return client;
        }
    }
}
