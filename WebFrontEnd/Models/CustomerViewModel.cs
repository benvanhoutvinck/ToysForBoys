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
        [Display(Name= "Naam")]
        public string name { get; set; }
        [Required]
        [Display(Name = "Straat en nummer")]
        public string streetAndNumber { get; set; }
        [Required]
        [Display(Name = "Gemeente")]
        public string city { get; set; }
        [Required]
        [Display(Name = "Provincie")]
        public string state { get; set; }
        [Required]
        [Display(Name = "Postcode")]
        public string postalCode { get; set; }
        [Required]
        public Nullable<int> countryId { get; set; }
    }
}