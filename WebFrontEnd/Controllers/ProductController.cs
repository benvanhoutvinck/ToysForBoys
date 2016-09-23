using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataAccessLayer.Interfaces;
using DataAccessLayer.Services;
using WebFrontEnd.Models;
using DataAccessLayer;
using WebFrontEnd.Infrastructure;

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
            var products = productService.GetAll();

            var productListViewModel = new Models.ProductListViewModel();

            productListViewModel.AllProductLines = productLineService.GetAll();

            var productList = new List<ProductListItem>();


            foreach (var product in products)
            {
                product.productline = productListViewModel.AllProductLines
                    .FirstOrDefault(pl => pl.id == product.productlineId);

                productList.Add
                   (
                       new ProductListItem(product)
                   );
            }

            productListViewModel.Products = productList;
            productListViewModel.FilterProductLines = productListViewModel.AllProductLines.Select(pl => pl.id).ToList();

            return View(productListViewModel);
        }

        [HttpPost]
        public ActionResult List([ModelBinder(typeof(Infrastructure.ProductListViewModelBinder))] Models.ProductListViewModel model)
        {
            var productLines = productLineService.GetAll();
            IEnumerable<Product> products;

            if (ModelState.IsValid)
            {
                Func<Product, bool> filter;

                if (string.IsNullOrEmpty(model.FilterProductName))
                {
                    if (model.FilterOnPrice)
                    {
                        filter = product => model.FilterProductLines.Contains(product.productlineId) &&
                                            product.buyPrice >= model.FilterBuyPriceMinimum && product.buyPrice <= model.FilterBuyPriceMaximum;
                    }
                    else
                    {
                        filter = product => model.FilterProductLines.Contains(product.productlineId);
                    }
                }
                else
                {
                    if (model.FilterOnPrice)
                    {

                        filter = product => model.FilterProductLines.Contains(product.productlineId) &&
                                        product.name.ToLower().Contains(model.FilterProductName.ToLower()) &&
                                        product.buyPrice >= model.FilterBuyPriceMinimum && product.buyPrice <= model.FilterBuyPriceMaximum;
                    }
                    else
                    {
                        filter = product => model.FilterProductLines.Contains(product.productlineId) &&
                                        product.name.ToLower().Contains(model.FilterProductName.ToLower());
                    }
                }


                products = productService
                    .GetAll
                    (
                        filter,
                        "productline"
                    );


            }
            else
            {
                products = productService.GetAll("productline");
            }

            model.AllProductLines = productLines;

            var productList = new List<ProductListItem>();

            foreach (var product in products)
            {
                productList.Add
                    (
                        new ProductListItem(product)
                    );
            }

            model.Products = productList;

            return View(model);
        }

    }
}