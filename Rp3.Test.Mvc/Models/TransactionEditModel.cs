using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Rp3.Test.Mvc.Models
{
    public class TransactionEditModel
    {
        public int TransactionId { get; set; }
        [Required(ErrorMessage = "Please enter transaction type")]
        public short TransactionTypeId { get; set; }
        [Required(ErrorMessage = "Please enter transaction category")]
        public int CategoryId { get; set; }
        [Required(ErrorMessage = "Please enter transaction date")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime? RegisterDate { get; set; }
        public DateTime? DateUpdate { get; set; }
        public string ShortDescription { get; set; }
        public string Notes { get; set; }
        [Required(ErrorMessage = "Please enter transaction amount")]
        public decimal Amount { get; set; }
        public int UserId { get; set; }

        public SelectList CategorySelectList { get; set; }
        public SelectList TransactionTypeSelectList { get; set; }
    }
}