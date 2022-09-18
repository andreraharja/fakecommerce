import 'package:fakecommerce/controller/manage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageField extends StatelessWidget {
  const ManageField(
      {Key? key, required ManagePageController managePageController})
      : _managePageController = managePageController,
        super(key: key);

  final ManagePageController _managePageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        fieldInput('Title', _managePageController.txtTitle.value),
        const SizedBox(
          height: 10,
        ),
        fieldInput('Category', _managePageController.txtCategory.value),
        const SizedBox(
          height: 10,
        ),
        fieldInput('Description', _managePageController.txtDescription.value),
        const SizedBox(
          height: 10,
        ),
        fieldInput('Image', _managePageController.txtImage.value),
        const SizedBox(
          height: 10,
        ),
        fieldInput('Price', _managePageController.txtPrice.value),
        SizedBox(
          height: context.height * 0.05,
        ),
      ],
    );
  }

  Widget fieldInput(String value, TextEditingController txtField) {
    if (value == "Image") {
      return TextFormField(
        onTap: () {
          _managePageController.uploadImage();
        },
        validator: (value) =>
            value!.trim().isEmpty ? '$value Product Required' : null,
        controller: txtField,
        readOnly: true,
        maxLines: null,
        decoration: InputDecoration(labelText: value),
      );
    } else if (value == "Price") {
      return TextFormField(
        textInputAction: TextInputAction.done,
        controller: txtField,
        keyboardType: const TextInputType.numberWithOptions(
            decimal: false, signed: false),
        decoration: InputDecoration(label: Text(value)),
        validator: (value) =>
            value!.trim().isEmpty ? '$value Product Required' : null,
      );
    } else {
      return TextFormField(
        textInputAction: TextInputAction.next,
        controller: txtField,
        decoration: InputDecoration(label: Text(value)),
        validator: (value) =>
            value!.trim().isEmpty ? '$value Product Required' : null,
      );
    }
  }
}
