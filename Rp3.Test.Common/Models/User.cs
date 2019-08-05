using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Rp3.Test.Common.Models
{
    public class User
    {
        public int UserId { get; set; }
        public string PersonName { get; set; }
        public string AccountNumber { get; set; }   
        public DateTime? RegisterDate { get; set; }
        public DateTime? DateUpdate { get; set; }

        public string Password { get; set; }
        public string UserName { get; set; }
    }
}
