using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using DataAccessLayer;
using DataAccessLayer.Services;
namespace Tests
{
    [TestClass]
    public class UnitTest1
    {
        
            [TestMethod]
        public void CustomerInsert()
        {
            var New = new Customer { name = "name", city = "city", countryId = 5, postalCode = "dds", streetAndNumber = "Street" };
            var service = new CustomerService();

            service.Insert(New);

            Assert.IsNotNull(New.id);
        }

        [TestMethod]

            public void DeleteCustomer()
            {
            var service = new CustomerService();
            var deleteObject = service.GetById(16);
            service.Delete(deleteObject);

            Assert.IsNull(service.GetById(16));
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
        
    }
}
