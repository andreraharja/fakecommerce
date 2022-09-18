import 'package:fakecommerce/model/data_product.dart';
import 'package:fakecommerce/view/manage/manage_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPageController extends GetxController {
  var lsDataProduct = List<DataProduct>.empty().obs;
  var isLoading = true.obs;
  final scrollController = ScrollController();

  @override
  void onInit() async {
    lsDataProduct.value = await DataProduct().getDataProduct();
    isLoading(false);
    super.onInit();
  }

  void toEditPage(
    int index,
  ) async {
    List editProdcut = await Get.to(() => ManagePage(),
        arguments: ['edit', lsDataProduct, index]);
    if (editProdcut.isNotEmpty) {
      if (editProdcut[0] == 'edit') {
        lsDataProduct[lsDataProduct.indexWhere(
            (element) => element.id == editProdcut[1].id)] = editProdcut[1];
      } else {
        lsDataProduct.removeWhere((item) => item.id == editProdcut[1].id);
      }
    }
  }

  void toAddPage() async {
    DataProduct? newProdcut =
        await Get.to(() => ManagePage(), arguments: ['create']);
    if (newProdcut != null) {
      lsDataProduct.add(newProdcut);
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
  }
}
