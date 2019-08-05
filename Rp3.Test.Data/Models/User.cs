using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Rp3.Test.Data.Models
{
    [Table("tbUser", Schema = "dbo")]
    public class User
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int UserId { get; set; }
        public string PersonName { get; set; }
        public string AccountNumber { get; set; }
        public DateTime? RegisterDate { get; set; }
        public DateTime? DateUpdate { get; set; }

        [DataType(DataType.Password)]
        public string Password { get; set; }
        public string UserName { get; set; }
    }
}
