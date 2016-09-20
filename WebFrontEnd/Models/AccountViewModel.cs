using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataAccessLayer;
using System.Web.Mvc;

namespace WebFrontEnd.Models
{
    public class AccountViewModel
    {
        public Customer customer { get; set; }
        public SelectList countries { get; set; }
    }
}