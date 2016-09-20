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
        [Required(ErrorMessage = "Naam is een verplicht veld")]
        [Display(Name= "Naam")]
        public string name { get; set; }
        [Required(ErrorMessage = "Straat en nummer is een verplicht veld")]
        [Display(Name = "Straat en nummer")]
        public string streetAndNumber { get; set; }
        [Required(ErrorMessage = "Gemeente is een verplicht veld")]
        [Display(Name = "Gemeente")]
        public string city { get; set; }
        [Required(ErrorMessage = "Provincie is een verplicht veld")]
        [Display(Name = "Provincie")]
        public string state { get; set; }
        [Required(ErrorMessage = "Postcode is een verplicht veld")]
        [Display(Name = "Postcode")]
        public string postalCode { get; set; }
        [Required(ErrorMessage = "Land is een verplicht veld")]
        [Display(Name = "Land")]
        public int countryId { get; set; }
    }
}