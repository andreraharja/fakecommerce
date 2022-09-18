import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../model/data_product.dart';

class ManagePageController extends GetxController {
  var txtTitle = TextEditingController().obs;
  var txtCategory = TextEditingController().obs;
  var txtDescription = TextEditingController().obs;
  var txtPrice = TextEditingController().obs;
  var txtImage = TextEditingController().obs;
  var image = File("").obs;
  final picker = ImagePicker();
  String mode = "";

  ManagePageController(this.arguments);
  dynamic arguments;

  @override
  void onInit() {
    mode = arguments[0];
    if (mode == 'edit') {
      txtTitle.value.text = arguments[1][arguments[2]].title;
      txtCategory.value.text = arguments[1][arguments[2]].category;
      txtDescription.value.text = arguments[1][arguments[2]].description;
      txtImage.value.text = arguments[1][arguments[2]].image;
      txtPrice.value.text = arguments[1][arguments[2]].price.toString();
    }
    super.onInit();
  }

  void addProdcut() async {
    Get.dialog(
        WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        barrierDismissible: false);

    DataProduct newDataProduct = await DataProduct().addDataProduct(DataProduct(
        title: txtTitle.value.text,
        category: txtCategory.value.text,
        description: txtDescription.value.text,
        image: txtImage.value.text,
        price: double.parse(txtPrice.value.text)));

    txtTitle.value.clear();
    txtCategory.value.clear();
    txtDescription.value.clear();
    txtPrice.value.clear();
    txtImage.value.clear();

    Get.back();
    Get.back(result: newDataProduct);
  }

  void updateProdcut() async {
    Get.dialog(
        WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        barrierDismissible: false);

    DataProduct editDataProduct = await DataProduct().updateDataProduct(
        DataProduct(
            id: arguments[1][arguments[2]].id,
            title: txtTitle.value.text,
            category: txtCategory.value.text,
            description: txtDescription.value.text,
            image: txtImage.value.text,
            price: double.parse(txtPrice.value.text)));

    txtTitle.value.clear();
    txtCategory.value.clear();
    txtDescription.value.clear();
    txtPrice.value.clear();
    txtImage.value.clear();

    Get.back();
    Get.back(result: ['edit', editDataProduct]);
  }

  void deleteProduct() async {
    Get.dialog(AlertDialog(
        title: const Text("Message"),
        content: const Text("Delete this product ?"),
        actions: <Widget>[
          TextButton(
            child: const Text("Yes"),
            onPressed: () async {
              Get.dialog(
                  WillPopScope(
                    onWillPop: () async {
                      return false;
                    },
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  barrierDismissible: false);

              DataProduct deleteDataProduct = await DataProduct()
                  .deleteDataProduct(arguments[1][arguments[2]].id);

              Get.back();
              Get.back();
              Get.back(result: ['delete', deleteDataProduct]);
            },
          ),
          TextButton(
            child: const Text("No"),
            onPressed: () {
              Get.back();
            },
          ),
        ]));
  }

  void uploadImage() {
    Get.dialog(
        AlertDialog(content: const Text("Pick Source Image"), actions: <Widget>[
      TextButton(
        child: const Text("Camera"),
        onPressed: () async {
          Get.back();
          final pickedFile = await picker.pickImage(
              source: ImageSource.camera, imageQuality: 25);
          if (pickedFile != null) {
            image.value = File(pickedFile.path);
            txtImage.value.text = pickedFile.path;
          }
        },
      ),
      TextButton(
        child: const Text("Gallery"),
        onPressed: () async {
          Get.back();
          final pickedFile = await picker.pickImage(
              source: ImageSource.gallery, imageQuality: 25);
          if (pickedFile != null) {
            image.value = File(pickedFile.path);
            txtImage.value.text = pickedFile.path;
          }
        },
      ),
    ]));
  }
}
