import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'companies_page.dart';
import 'upload_cv_page.dart';
import 'analysis_page.dart';
import 'profile_page.dart';

class HomeScreen extends StatefulWidget {
  final bool isHR;
  const HomeScreen({super.key, this.isHR = false});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = const [
      CompaniesPage(),
      UploadCvPage(),
      AnalysisPage(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      floatingActionButton: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: AppTheme.accentGreen,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppTheme.accentGreen.withOpacity(0.3),
              blurRadius: 12,
              spreadRadius: 2,
            ),
          ],
        ),
        child: IconButton(
          icon: const Icon(Icons.add, color: Colors.black, size: 28),
          onPressed: () {
            // Action for FAB
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppTheme.secondaryBg,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          backgroundColor: Colors.transparent,
          selectedItemColor: AppTheme.accentGreen,
          unselectedItemColor: AppTheme.textSecondary,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_rounded),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
