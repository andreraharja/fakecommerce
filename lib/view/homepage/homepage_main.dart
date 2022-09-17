import 'package:fakecommerce/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomePageController _homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FakeCommerce'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Obx(() => _homePageController.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: _homePageController.lsDataProduct.length,
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 5,
                        child: Row(
                          children: [
                            SizedBox(
                              width: context.width * 0.3,
                              height: context.height * 0.2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(_homePageController
                                    .lsDataProduct[index].image!),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _homePageController
                                          .lsDataProduct[index].title!,
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      _homePageController
                                          .lsDataProduct[index].description!,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.green,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(_homePageController
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
                            ),
                          ],
                        ));
                  }),
            )),
    );
  }
}
