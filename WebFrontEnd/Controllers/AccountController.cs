﻿using DataAccessLayer;
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
        private IOrderdetailsService orderdetailService;
        private IOrderService orderService;

        public AccountController()
        {
            countryService = new CountryService();
            customerService = new CustomerService();
            orderdetailService = new OrderdetailService();
            orderService = new OrderService();
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

                customerService.Insert(new Customer { id = 200, name = model.name, city = model.city, state = model.state, countryId = model.countryId, postalCode = model.postalCode, streetAndNumber = model.streetAndNumber, email = model.email, password = model.password });

                return RedirectToAction("List", "Product");
            }

            ViewBag.Countries = getCountriesList();
            return View(model);

        }

        public ActionResult Edit()
        {
            Customer cust = (Customer)this.Session["customer"];
            if (cust != null)
            {
                cust = customerService.GetById(cust.id);
                CustomerViewModel customerViewModel = new CustomerViewModel(cust);

                ViewBag.Countries = getCountriesList();

                return View(customerViewModel);
            }
            else
            {
                return RedirectToAction("Login", "Account", new { returnUrl = "Account/Edit" } );
            }
        }
        [HttpPost]
        public ActionResult Edit(CustomerViewModel custViewModel)
        {
            Customer cust = customerService.GetById(custViewModel.id);
            try
            {
                if (cust.password.Trim() == custViewModel.password)
                {
                    cust.name = custViewModel.name;
                    cust.streetAndNumber = custViewModel.streetAndNumber;
                    cust.city = custViewModel.city;
                    cust.state = custViewModel.state;
                    cust.postalCode = custViewModel.postalCode;
                    cust.countryId = custViewModel.countryId;
                    cust.country = countryService.GetById(custViewModel.countryId);
                    if (custViewModel.newPassword != null)
                    {
                        cust.password = custViewModel.newPassword;
                    }
                    cust.email = custViewModel.email;

                    customerService.Edit(cust);
                    this.Session["customer"] = cust;

                    return RedirectToAction("ConfirmEdit", "Account", new { gelukt = true });
                }
                else
                {
                    throw new Exception();
                }
            }
            catch (Exception)
            {

                return RedirectToAction("ConfirmEdit", "Account", new { gelukt = false });
            }
        }
        public ActionResult ConfirmEdit(bool gelukt)
        {
            return View(gelukt);
        }
        public ActionResult ShowOrders(Customer cust)
        {
            var linkedCust = customerService.GetById(cust.id, "orders.orderdetails.product");
            var orders = linkedCust.orders;

            return View(orders);
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
            ViewBag.returnUrl = returnUrl;
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

                if (returnUrl != null && returnUrl != "")
                {
                    Char delimiter = '/';
                    String[] substrings = returnUrl.Split(delimiter);
                    foreach (string str in substrings)
                    {
                        return RedirectToAction(substrings[1], substrings[0]);

                    }
                }

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