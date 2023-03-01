import 'package:flutter/material.dart';

enum MenuAction { logout, switchuser }

var popup = PopupMenuButton(
  onSelected: (value) async {
    switch (value) {
      case MenuAction.logout:
        break;
      case MenuAction.switchuser:
        break;
    }
  },
  itemBuilder: (BuildContext context) {
    return const [
      PopupMenuItem<MenuAction>(
        child: Text('Log Out'),
        value: MenuAction.logout,
      ),
      PopupMenuItem<MenuAction>(
        child: Text('Switch User'),
        value: MenuAction.switchuser,
      )
    ];
  },
);
