import 'package:flutter/material.dart';

import '../../controller/manage_controller.dart';

class ManageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ManageAppBar({
    Key? key,
    required ManagePageController managePageController,
  })  : _managePageController = managePageController,
        super(key: key);

  final ManagePageController _managePageController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(_managePageController.mode == 'create'
          ? 'Add Prodcut'
          : 'Edit Product'),
      actions: [
        _managePageController.mode == 'create'
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
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}