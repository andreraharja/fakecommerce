import 'package:fakecommerce/controller/product_controller.dart';
import 'package:fakecommerce/view/product/product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);
  final ProductPageController _productPageController =
      Get.put(ProductPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FakeCommerce'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Obx(() => _productPageController.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductList(
                productPageController: _productPageController,
              ),
            )),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.green,
          onPressed: () {
            _productPageController.toAddPage();
          },
          label: const Text('Add Product')),
    );
  }
}
