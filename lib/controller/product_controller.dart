import 'package:fakecommerce/model/data_product.dart';
import 'package:fakecommerce/view/manage_page.dart';
import 'package:get/get.dart';

class ProductPageController extends GetxController {
  var lsDataProduct = List<DataProduct>.empty().obs;
  var isLoading = true.obs;

  @override
  void onInit() async {
    lsDataProduct.value = await DataProduct().getDataProduct();
    isLoading(false);
    super.onInit();
  }

  void toEditPage(
    String mode,
    int index,
  ) async {
    List editProdcut = await Get.to(() => ManagePage(),
        arguments: [mode, lsDataProduct, index]);
    if (editProdcut.isNotEmpty) {
      if (editProdcut[0] == 'edit') {
        lsDataProduct[lsDataProduct.indexWhere(
            (element) => element.id == editProdcut[1].id)] = editProdcut[1];
      } else {
        lsDataProduct.removeWhere((item) => item.id == editProdcut[1].id);
      }
    }
  }

  void toAddPage(
    String mode,
  ) async {
    DataProduct? newProdcut =
        await Get.to(() => ManagePage(), arguments: [mode]);
    if (newProdcut != null) {
      lsDataProduct.add(newProdcut);
    }
  }
}
