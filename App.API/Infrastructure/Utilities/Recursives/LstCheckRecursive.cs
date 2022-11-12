namespace App.API.Infrastructure.Utilities.Recursives
{
    public class LstCheckRecursive
    {
        public bool GetBoolVa(List<bool> list)
        {
            if (list.Count > 1)
            {
                bool a = (list[0] == true);
                list.RemoveAt(0);
                return GetBoolVa(list) && a;
            }
            else
            {
                bool a = (list[0] == true);
                return a;
            }
        }
        // cho truong hop hoặc
        public bool GetBoolHoac(List<bool> list)
        {
            if (list.Count > 1)
            {
                bool a = (list[0] == true);
                list.RemoveAt(0);
                return GetBoolHoac(list) || a;
            }
            else
            {
                bool a = (list[0] == true);
                return a;
            }
        }
    }
}
