using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Rp3.Test.Mvc.Models
{
    public class UserEditModel
    {
        public int UserId { get; set; }
        public string PersonName { get; set; }
        public string AccountNumber { get; set; }

        public DateTime? RegisterDate { get; set; }
        public DateTime? DateUpdate { get; set; }

        public string Email { get; set; }
        public string Password { get; set; }
    }
}