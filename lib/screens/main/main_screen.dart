import 'package:admin/controllers/menu_app_controller.dart';
import 'package:admin/controllers/navigation_controller.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/add_user/add_user.dart';
import 'package:admin/screens/admin_actions/admin_actions.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:admin/screens/notification/notification.dart';
import 'package:admin/screens/profile/profile.dart';
import 'package:admin/screens/settings/settings.dart';
import 'package:admin/screens/task/task.dart';
import 'package:admin/screens/training_request/training_requests.dart';
import 'package:admin/screens/users_account/user_accounts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  
  final _screens =  <Widget>[
    DashboardScreen(),  
     // index 0
    UserAccountScreen(),     // index 1
    TaskScreen(),
    TrainingRequestScreen(),
    AdminActionsScreen(),
    NotificationScreen(), 
    
    ProfileScreen(),
    SettingsScreen(),
    AddUserScreen(),
       // index 2
    // etc…
  ];
  @override
  Widget build(BuildContext context) {
    
final nav = context.watch<NavigationController>();
    return Scaffold(
     key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: _screens[nav.selectedIndex],
            ),
          ],
        ),
      ),
    );
  }
}
