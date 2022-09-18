import 'package:flutter/material.dart';

import '../../controller/manage_controller.dart';

class ManageButton extends StatelessWidget {
  const ManageButton({
    Key? key,
    required GlobalKey<FormState> formKey,
    required ManagePageController managePageController,
  })  : _formKey = formKey,
        _managePageController = managePageController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final ManagePageController _managePageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.green),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (_managePageController.mode == 'create') {
                _managePageController.addProdcut();
              } else {
                _managePageController.updateProdcut();
              }
            }
          },
          child: Text(_managePageController.mode == 'create'
              ? 'Add Product'
              : 'Update Product')),
    );
  }
}
