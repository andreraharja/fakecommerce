import 'package:fakecommerce/model/data_product.dart';
import 'package:get/get.dart';

class ProductPageController extends GetxController{
  var lsDataProduct = List<DataProduct>.empty().obs;
  var isLoading = true.obs;

  @override
  void onInit() async {
    lsDataProduct.value = await DataProduct().getDataProduct();
    isLoading(false);
    super.onInit();
  }
}