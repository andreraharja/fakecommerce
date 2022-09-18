import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../../controller/product_controller.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
      required ProductPageController productPageController,
      required this.index})
      : _productPageController = productPageController,
        super(key: key);

  final ProductPageController _productPageController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                imageAndPrice(context),
                const SizedBox(
                  width: 10,
                ),
                infoAndRating(context),
              ],
            ),
          ),
        ));
  }

  Widget imageAndPrice(BuildContext context) {
    return SizedBox(
      width: context.width * 0.3,
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.attach_money),
              Text(_productPageController.lsDataProduct[index].price.toString())
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          _productPageController.lsDataProduct[index].image!.contains("http")
              ? SizedBox(
                  height: context.height * 0.15,
                  child: Image.network(
                      _productPageController.lsDataProduct[index].image!),
                )
              : SizedBox(
                  height: context.height * 0.15,
                  child: Image.file(
                    File(_productPageController.lsDataProduct[index].image!),
                  )),
        ],
      ),
    );
  }

  Widget infoAndRating(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _productPageController.lsDataProduct[index].title!,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Text(
              _productPageController.lsDataProduct[index].description!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _productPageController.lsDataProduct[index].rating == null
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                      width: 10,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
