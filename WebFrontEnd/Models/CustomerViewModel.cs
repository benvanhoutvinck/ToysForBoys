using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebFrontEnd.Models
{
    public class CustomerViewModel
    {

        public int id { get; set; }
        [Required]
        [Display(Name = "Name")]
        public string name { get; set; }
        [Required]
        [Display(Name = "Street and number")]
        public string streetAndNumber { get; set; }
        [Required]
        [Display(Name = "City")]
        public string city { get; set; }
        [Required]
        [Display(Name = "Province")]
        public string state { get; set; }
        [Required]
        [Display(Name = "Postal code")]
        public string postalCode { get; set; }
        [Required]
        [Display(Name = "Country")]
        public int countryId { get; set; }
        [Required]
        [Display(Name = "Email")]
        public string email { get; set; }
        [Required]
        [Display(Name = "Password")]
        public string password { get; set; }
    }
}