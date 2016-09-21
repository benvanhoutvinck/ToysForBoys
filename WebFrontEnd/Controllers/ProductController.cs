using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataAccessLayer.Interfaces;
using DataAccessLayer.Services;
using WebFrontEnd.Models;
using DataAccessLayer;

namespace WebFrontEnd.Controllers
{
    public class ProductController : Controller
    {
        private IProductService productService;
        private IProductlineService productLineService;
        
        public ProductController()
        {
            productService = new ProductService();
            productLineService = new ProductlineService();
        }

        public ActionResult List()
        {
            var products = productService.GetAll("productline");
            
            var productListViewModel = new ProductListViewModel();

            var productList = new List<ProductListItem>();

            foreach (var product in products)
            {
                 productList.Add
                    (
                        new ProductListItem()
                        {
                            ProductName = product.name,
                            Category = product.productline.name,
                            Description = product.description,
                            Scale = product.scale,
                            ProductID = product.id,
                            ProductLineID = product.productlineId ?? 0
                        }
                    );
            }

            productListViewModel.Products = productList;
            productListViewModel.AllProductLines = products.Select(p => p.productline).Distinct();

            return View(productListViewModel);
        }

        [HttpPost]
        public ActionResult List(ProductListViewModel model)
        {

            return View(model);
        }
        
    }
}