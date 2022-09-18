import 'package:fakecommerce/view/manage/manage_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/manage_controller.dart';
import 'manage_appbar.dart';
import 'manage_button.dart';

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
          if (_managePageController.mode == 'create') {
            Get.back(result: null);
          } else {
            Get.back(result: []);
          }
          return true;
        },
        child: Scaffold(
          appBar: ManageAppBar(managePageController: _managePageController),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ManageField(managePageController: _managePageController),
                    ManageButton(
                        formKey: _formKey,
                        managePageController: _managePageController)
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
