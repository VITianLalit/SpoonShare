import 'package:flutter/material.dart';
import 'package:spoonshare/screens/admin/admin_home.dart';
import 'package:spoonshare/screens/dashboard/dashboard_page.dart';
import 'package:spoonshare/screens/ngo/ngo_home.dart';
import 'package:spoonshare/screens/volunteer/volunteer_home.dart';

class DashboardHomePage extends StatefulWidget {
  final String role;

  const DashboardHomePage({Key? key, required this.role}) : super(key: key);

  @override
  _DashboardHomePageState createState() => _DashboardHomePageState();
}

class _DashboardHomePageState extends State<DashboardHomePage> {
  late Widget screen;

  @override
  void initState() {
    super.initState();
    _navigateToRoleScreen();
  }

  void _navigateToRoleScreen() {
    switch (widget.role) {
      case 'Volunteer':
        screen = const VolunteerHomeScreen();
        break;
      case 'NGO':
        screen = const NGOHomeScreen();
        break;
      case 'Admin':
        screen = const AdminHomeScreen();
        break;
      default:
        screen = const DashboardPage();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (screen.toString().isEmpty) ? Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 80,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Colors.white),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(
              'Redirecting...',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ) : screen,
    );
  }
}
