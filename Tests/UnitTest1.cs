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
            { SortDateRange = null, DateRangeStart = null, DateRangeEnd = null,
            CustomerId = null, Status = "CANCELLED",
            SortDateCompareLeft = null, DateCompareMode = null, SortDateCompareRight = null});


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
            var New = new Customer { name = "name", city = "city", countryId = 5, postalCode = "dds", streetAndNumber = "Street", email="a@a.com" };
            var service = new CustomerService();

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
            var New = new Product { name = "name", buyPrice=20, description="desc", productlineId=3, scale="scale", quantityInOrder=1, quantityInStock=2};
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
                if (ad.username.Equals(admin.username))
                    service.Delete(ad);

            service.Insert(admin);

            Assert.IsNotNull(admin.id);
        }


        //method op zich werkt goed, testmethod niet door typedifference (die wij precies nie zien)
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
            Assert.AreEqual(customers, result);
        }

    }
}
