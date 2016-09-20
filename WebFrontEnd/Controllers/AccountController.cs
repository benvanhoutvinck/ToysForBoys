using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebFrontEnd.Models;
using DataAccessLayer.Interfaces;
using WebFrontEnd.Mock;
using DataAccessLayer.Services;

namespace WebFrontEnd.Controllers
{
    public class AccountController : Controller
    {

        private ICountryService countryService;
        private ICustomerService customerService;

        public AccountController()
        {
            countryService = new CountryServiceMock();
            customerService = new CustomerService();
        }

        // GET: Account
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Register()
        {
                        
            var countries = countryService.GetAll();

            var countriesSelectList = new List<SelectListItem>();

            foreach (var country in countries)
            {
                countriesSelectList.Add
                    (
                        new SelectListItem()
                        {
                            Text = country.name,
                            Value = country.id.ToString()
                        }
                    );
            }

            ViewBag.Countries = new SelectList(countriesSelectList, "Value", "Text", 1);

            return View();
        }
        [HttpPost]
        public ActionResult Register(CustomerViewModel model)
        {
            if (ModelState.IsValid)
            {

                customerService.Insert(new Customer() { name = model.name, city = model.city, countryId = model.countryId, postalCode = model.postalCode, streetAndNumber = model.streetAndNumber });

                return RedirectToAction("Index", "Home");
            }

            return RedirectToAction("Index");

        }
    }
}