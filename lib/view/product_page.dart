import 'dart:io';

import 'package:fakecommerce/controller/product_controller.dart';
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
              child: ListView.builder(
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
                        child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
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
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          _productPageController
                                                  .lsDataProduct[index].image!
                                                  .contains("http")
                                              ? SizedBox(
                                                  height: context.height * 0.15,
                                                  child: Image.network(
                                                      _productPageController
                                                          .lsDataProduct[index]
                                                          .image!),
                                                )
                                              : SizedBox(
                                                  height: context.height * 0.15,
                                                  child: Image.file(
                                                    File(_productPageController
                                                        .lsDataProduct[index]
                                                        .image!),
                                                  )),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
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
                                          Expanded(
                                            child: Text(
                                              _productPageController
                                                  .lsDataProduct[index]
                                                  .description!,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          _productPageController
                                                      .lsDataProduct[index]
                                                      .rating ==
                                                  null
                                              ? Container()
                                              : Row(
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
                                                        .lsDataProduct[index]
                                                        .rating!
                                                        .rate
                                                        .toString()),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                  ],
                                                ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      );
                    }
                  }),
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
