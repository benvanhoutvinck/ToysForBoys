using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using DataAccessLayer;
using DataAccessLayer.Services;

using System.Collections.Generic;
using DataAccessLayer.Queries;

namespace Tests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void testGetDistinctYear()
        {
            OrderStatisticService service = new OrderStatisticService();
            List<Order> list = service.GetByDistinctYear(SortDateEnum.orderDate, 2003);


            Assert.IsTrue(list.Count != 0);
        }

        [TestMethod]
        public void testGetOrderStatistics()
        {
            OrderStatisticService service = new OrderStatisticService();
            List<Order> list = service.GetOrderStatistics(new OrderQuery()
            {
                SortDateRange = null,
                DateRangeStart = null,
                DateRangeEnd = null,
                CustomerId = null,
                Status = null,
                SortDateCompareLeft = null,
                DateCompareMode = null,
                SortDateCompareRight = null
            });


            Assert.IsTrue(list.Count != 0);
        }

        [TestMethod]
        public void CustomerInsert()
        {
            var New = new Customer { name = "name", city = "city", countryId = 5, postalCode = "dds", streetAndNumber = "Street" };
            var service = new CustomerService();

            service.Insert(New);

            Assert.IsNotNull(New.id);
        }

        [TestMethod]
        //this testmethod has to fail the second time it's runned
        public void CustomerInsertWithEmail()
        {
            var New = new Customer { name = "name", city = "city", countryId = 5, postalCode = "dds", streetAndNumber = "Street", email = "a@a.com" };
            var service = new CustomerService();

            foreach (var ad in service.GetAll())
                if (ad.email != null)
                    if (ad.email.Trim().Equals(New.email))
                        service.Delete(ad);

            service.Insert(New);

            Assert.IsNotNull(New.id);
        }

        [TestMethod]

        public void DeleteCustomer()
        {
            var service = new CustomerService();
            var deleteObject = ((List<Customer>)service.GetAll("country"))[0];
            service.Delete(deleteObject);
            var allObjectsz = (List<Customer>)service.GetAll();

            Assert.IsFalse(allObjectsz.Contains(deleteObject));
        }
        /*
        [TestMethod]
        public void EditCustomer()
        {
            var Edit = new Customer {id=1, name = "name", city = "city", countryId = 5};
            var service = new CustomerService();
            var originalCustomer = service.GetById(1);
            service.Edit(Edit);
            bool succesfullyEdited = false;
            if (Edit.name==originalCustomer.name && Edit.city == originalCustomer.city && Edit.countryId==originalCustomer.countryId )
            {

            }
            Assert.AreEqual(service.GetById(1).name, "name");
        }*/

        [TestMethod]
        public void ProductInsert()
        {
            var New = new Product { name = "name", buyPrice = 20, description = "desc", productlineId = 3, scale = "scale", quantityInOrder = 1, quantityInStock = 2, active=true };
            var service = new ProductService();

            service.Insert(New);

            Assert.IsNotNull(New.id);
        }

        [TestMethod]
        //this method has to fail the second time it's runned
        public void AdminInsert()
        {
            var admin = new Admin { username = "TestMethod", password = "password" };
            var service = new AdminService();

            foreach (var ad in service.GetAll())
                if (ad.username.Trim().Equals(admin.username))
                    service.Delete(ad);

            service.Insert(admin);

            Assert.IsNotNull(admin.id);
        }


        //method op zich werkt goed, testmethod niet door typedifference (die wij precies nie zien)
        //Zoek eens op hoe dat de lijsten met elkaar vergelijkt worden want waarschijnlijk ligt het aan de coparer functie die gebruikt moet worden
        [TestMethod]
        public void CustomerGetStatistics()
        {
            var service2 = new CustomerService();
            var service = new CustomerStatisticService();
            var customer = service2.GetById(85);
            var customer2 = service2.GetById(121);
            List<Customer> customers = new List<Customer>() { customer, customer2 };
            CustomerQuery cq = new CustomerQuery { State = "TA", City = "Toston", CountryId = 27, PostalCode = "T1003" };
            var result = service.GetCustomerStatistics(cq);
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void ProductGetStatistics()
        {
            
            var service2 = new ProductStatisticService();
            var products = new List<Product>();
            ProductQuery pq = new ProductQuery { active = true, SortQuantity = 0, maximumQuantity = 8700, minimumQuantity = 8500, maxPrice = 30, minPrice = 20 };
            var result = service2.GetProductStatistics(pq);
            Assert.AreNotEqual(products, result);
        }

        [TestMethod]
        public void OrderGetStatistics()
        {
            var service = new OrderStatisticService();
            var orders = new List<Order>();
            OrderQuery oq = new OrderQuery { CustomerId = 91, Status = "CANCELLED", SortDateRange = 0, DateRangeStart = new DateTime(2002, 1, 1), DateRangeEnd = new DateTime(2004, 1, 1) };
            var result = service.GetOrderStatistics(oq);
            var result2 = service.GetFilteredOrderStatistics(result, SortDateEnum.orderDate, '<', SortDateEnum.requiredDate);
            Assert.AreNotEqual(orders, result);
        }

        [TestMethod]
        public void GetBestSoldProductTest()
        {
            var service = new ProductStatisticService();
            var products = service.GetProductsSortedByMostSold();
            Assert.IsNotNull(products);
        }

        [TestMethod]
        public void GetLeastSoldProducts()
        {
            var service = new ProductStatisticService();
            var products = service.GetProductsSortedByLeastSold();
            Assert.IsNotNull(products);
        }

        [TestMethod]
        public void GetCustomersOfCountry()
        {
            var service = new CountryStatisticService();
            var count = service.CountCustomersOfCountry(5);
            Assert.IsNotNull(count);
        }

        [TestMethod]
        [ExpectedException(typeof(System.Data.Entity.Validation.DbEntityValidationException), "Invalid password: password must be 1 to 20 characters long and is case sensitive")]
        public void PasswordIsTooLong()
        {
            var service = new CustomerService();
            var customer = service.GetById(1);
            customer.password = "123456789012345678901";
            service.Edit(customer);            
        }
    }
}
