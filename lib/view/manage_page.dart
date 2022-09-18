import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/manage_controller.dart';

class ManagePage extends StatelessWidget {
  ManagePage({Key? key}) : super(key: key);
  final ManagePageController _managePageController =
      Get.put(ManagePageController(Get.arguments));
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: WillPopScope(
        onWillPop: () async {
          if (Get.arguments[0] == 'create') {
            Get.back(result: null);
          } else {
            Get.back(result: []);
          }
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
                Get.arguments[0] == 'create' ? 'Add Prodcut' : 'Edit Product'),
            actions: [
              Get.arguments[0] == 'create'
                  ? Container()
                  : GestureDetector(
                      onTap: () {
                        _managePageController.deleteProduct();
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.delete),
                          SizedBox(
                            width: 10.0,
                          )
                        ],
                      ))
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _managePageController.txtTitle.value,
                      decoration: const InputDecoration(label: Text('Title')),
                      validator: (value) => value!.trim().isEmpty
                          ? 'Title Product Required'
                          : null,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _managePageController.txtCategory.value,
                      decoration:
                          const InputDecoration(label: Text('Category')),
                      validator: (value) => value!.trim().isEmpty
                          ? 'Category Product Required'
                          : null,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _managePageController.txtDescription.value,
                      decoration:
                          const InputDecoration(label: Text('Description')),
                      validator: (value) => value!.trim().isEmpty
                          ? 'Description Product Required'
                          : null,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onTap: () {
                        _managePageController.uploadImage();
                      },
                      validator: (value) => value!.trim().isEmpty
                          ? 'Image Product Required'
                          : null,
                      controller: _managePageController.txtImage.value,
                      readOnly: true,
                      maxLines: null,
                      decoration: const InputDecoration(labelText: 'Image'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      controller: _managePageController.txtPrice.value,
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: false, signed: false),
                      decoration: const InputDecoration(label: Text('Price')),
                      validator: (value) => value!.trim().isEmpty
                          ? 'Price Product Required'
                          : null,
                    ),
                    SizedBox(
                      height: context.height * 0.05,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (Get.arguments[0] == 'create') {
                                _managePageController.addProdcut();
                              } else {
                                _managePageController.updateProdcut();
                              }
                            }
                          },
                          child: Text(Get.arguments[0] == 'create'
                              ? 'Add Product'
                              : 'Update Product')),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
