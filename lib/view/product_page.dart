import 'package:fakecommerce/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);
  final ProductPageController _productPageController = Get.put(ProductPageController());

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
              child: ListView.builder(
                  itemCount: _productPageController.lsDataProduct.length + 1,
                  itemBuilder: (context, index) {
                    if (index == _productPageController.lsDataProduct.length) {
                      return SizedBox(
                        height: context.height * 0.1,
                      );
                    } else {
                      return Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: context.width * 0.3,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.attach_money),
                                          Text(_productPageController
                                              .lsDataProduct[index].price
                                              .toString())
                                        ],
                                      ),
                                      SizedBox(
                                        height: context.height * 0.15,
                                        child: Image.network(
                                            _productPageController
                                                .lsDataProduct[index].image!,
                                            fit: BoxFit.fitHeight),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _productPageController
                                            .lsDataProduct[index].title!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        _productPageController
                                            .lsDataProduct[index].description!,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.green,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(_productPageController
                                              .lsDataProduct[index].rating!.rate
                                              .toString()),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ));
                    }
                  }),
            )),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            
          }, label: const Text('Add Product')),
    );
  }
}
