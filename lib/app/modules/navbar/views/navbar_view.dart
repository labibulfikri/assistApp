import 'package:assist_apps/app/modules/akun/views/akun_view.dart';
import 'package:assist_apps/app/modules/aset/views/aset_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  const NavbarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomeView(),
                AsetView(),
                AkunView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex,
              selectedItemColor: Color(0xff0c2568),
              unselectedItemColor: Colors.grey.shade300,
              type: BottomNavigationBarType.fixed,
              items: [
                _bottomNavigationBarItem(Icons.home, "Home"),
                _bottomNavigationBarItem(Icons.account_balance, "Aset"),
                _bottomNavigationBarItem(Icons.calendar_month, "Akun"),
              ]),
        );
      },
    );
  }

  _bottomNavigationBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
