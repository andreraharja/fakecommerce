import 'package:fakecommerce/controller/product_controller.dart';
import 'package:fakecommerce/view/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductList extends StatelessWidget {
  const ProductList(
      {Key? key, required ProductPageController productPageController})
      : _productPageController = productPageController,
        super(key: key);

  final ProductPageController _productPageController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        controller: _productPageController.scrollController,
        itemCount: _productPageController.lsDataProduct.length + 1,
        itemBuilder: (context, index) {
          if (index == _productPageController.lsDataProduct.length) {
            return SizedBox(
              height: context.height * 0.1,
            );
          } else {
            return GestureDetector(
              onTap: () {
                _productPageController.toEditPage(index);
              },
              child: ProductCard(
                productPageController: _productPageController,
                index: index,
              ),
            );
          }
        }));
  }
}
