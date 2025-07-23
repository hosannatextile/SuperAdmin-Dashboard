import 'package:admin/controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<NavigationController>();

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo_white.png"),
          ),
          // DrawerListTile(
          //   title: "Dashboard",
          //   svgSrc: "assets/icons/menu_dashboard.svg",
          //   index: 0,
          //   selectedIndex: nav.selectedIndex,
          //   onTap: () {
          //     context.read<NavigationController>().setIndex(0);
          //     if (Navigator.canPop(context)) Navigator.pop(context);
          //   },
          // ),
          DrawerListTile(
            title: "User Accounts",
            svgSrc: "assets/icons/menu_tran.svg",
            index: 1,
            selectedIndex: nav.selectedIndex,
            onTap: () {
              context.read<NavigationController>().setIndex(1);
              if (Navigator.canPop(context)) Navigator.pop(context);
            },
          ),
          // DrawerListTile(
          //   title: "Task",
          //   svgSrc: "assets/icons/menu_task.svg",
          //   index: 2,
          //   selectedIndex: nav.selectedIndex,
          //   onTap: () {
          //     context.read<NavigationController>().setIndex(2);
          //     if (Navigator.canPop(context)) Navigator.pop(context);
          //   },
          // ),
          DrawerListTile(
            title: "Training Requests",
            svgSrc: "assets/icons/menu_doc.svg",
            index: 3,
            selectedIndex: nav.selectedIndex,
            onTap: () {
              context.read<NavigationController>().setIndex(3);
              if (Navigator.canPop(context)) Navigator.pop(context);
            },
          ),
          DrawerListTile(
            title: "Admin Actions",
            svgSrc: "assets/icons/menu_store.svg",
            index: 4,
            selectedIndex: nav.selectedIndex,
            onTap: () {
              context.read<NavigationController>().setIndex(4);
              if (Navigator.canPop(context)) Navigator.pop(context);
            },
          ),
          DrawerListTile(
            title: "Notification",
            svgSrc: "assets/icons/menu_notification.svg",
            index: 5,
            selectedIndex: nav.selectedIndex,
            onTap: () {
              context.read<NavigationController>().setIndex(5);
              if (Navigator.canPop(context)) Navigator.pop(context);
            },
          ),
          // DrawerListTile(
          //   title: "Profile",
          //   svgSrc: "assets/icons/menu_profile.svg",
          //   index: 6,
          //   selectedIndex: nav.selectedIndex,
          //   onTap: () {
          //     context.read<NavigationController>().setIndex(6);
          //     if (Navigator.canPop(context)) Navigator.pop(context);
          //   },
          // ),
          // DrawerListTile(
          //   title: "Settings",
          //   svgSrc: "assets/icons/menu_setting.svg",
          //   index: 7,
          //   selectedIndex: nav.selectedIndex,
          //   onTap: () {
          //     context.read<NavigationController>().setIndex(7);
          //     if (Navigator.canPop(context)) Navigator.pop(context);
          //   },
          // ),
          DrawerListTile(
            title: "Add User",
            svgSrc: "assets/icons/menu_setting.svg",
            index: 8,
            selectedIndex: nav.selectedIndex,
            onTap: () {
              context.read<NavigationController>().setIndex(8);
              if (Navigator.canPop(context)) Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.onTap,
    required this.index,
    required this.selectedIndex,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback onTap;
  final int index;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final isSelected = index == selectedIndex;

    return ListTile(
      onTap: onTap,
      selected: isSelected,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(
          isSelected ? Colors.blueAccent : Colors.white54,
          BlendMode.srcIn,
        ),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.blueAccent : Colors.white54,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
