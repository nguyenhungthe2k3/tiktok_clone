import 'package:flutter/material.dart';
import 'package:tiktok_clone/pages/add_video_page.dart';
import 'package:tiktok_clone/pages/home_page.dart';
import 'package:tiktok_clone/pages/mailbox_page.dart';
import 'package:tiktok_clone/pages/profile_page.dart';
import 'package:tiktok_clone/pages/shop_page.dart';
import 'package:tiktok_clone/widgets/custom_bottom_navigation_bar.dart';

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({super.key});

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int _selectedPageIndex = 0;

  static const List<Widget> _page = [
    HomePage(),
    ShopPage(),
    AddVideoPage(),
    MailBoxPage(),
    ProfilePage(),
  ];

  void _onIconTaped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _page[_selectedPageIndex],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedPageIndex: _selectedPageIndex,
        onIconTap: _onIconTaped,
      ),
    );
  }
}
