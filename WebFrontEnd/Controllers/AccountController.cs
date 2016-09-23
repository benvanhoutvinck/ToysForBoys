using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebFrontEnd.Models;
using DataAccessLayer.Interfaces;
using DataAccessLayer.Services;

namespace WebFrontEnd.Controllers
{
    public class AccountController : Controller
    {

        private ICountryService countryService;
        private ICustomerService customerService;

        public AccountController()
        {
            countryService = new CountryService();
            customerService = new CustomerService();
        }


        public ActionResult Register()
        {

            ViewBag.Countries = getCountriesList();

            return View();
        }
        [HttpPost]
        public ActionResult Register(CustomerViewModel model)
        {
            if (ModelState.IsValid)
            {
              
                customerService.Insert(new Customer { id=200, name = model.name, city = model.city, state = model.state, countryId = model.countryId, postalCode = model.postalCode, streetAndNumber = model.streetAndNumber, email=model.email, password=model.password });

                return RedirectToAction("List", "Product");
            }

            ViewBag.Countries = getCountriesList();
            return View(model);

        }

        private SelectList getCountriesList()
        {
            var countries = countryService.GetAll();

            var countriesSelectList = new List<SelectListItem>();

            countriesSelectList.Add
                   (
                       new SelectListItem()
                       {
                           Text = "-- Choose country --",
                           Value = "",
                           Selected = true
                       }
                   );

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

            return new SelectList(countriesSelectList, "Value", "Text", 0);
        }

        public ActionResult Login(string returnUrl)
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(LoginViewModel model, string returnUrl)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            Customer customer = customerService.LoginVerification(model.email, model.password);

            if (customer != null)
            {
                this.Session["customer"] = customer;
                return RedirectToAction("List", "Product");
            }
            else
            {
                ModelState.AddModelError("", "Foutieve login.");
            }

            return View(model);
        }
        //
        // POST: /Account/LogOff
        [HttpPost]
        public ActionResult LogOff()
        {
          
            this.Session["customer"] = null;
            return RedirectToAction("List", "Product");
        }
    }
}