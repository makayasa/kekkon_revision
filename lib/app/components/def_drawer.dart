import 'package:flutter/material.dart';
import 'package:kekkon_revision/app/modules/profile/views/profile_view.dart';

class DefDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ProfileView(),
    );
  }
}
