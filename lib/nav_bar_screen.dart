import 'package:flutter/material.dart';
import 'package:navbar/extensions.dart';
import 'package:navbar/screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'counter.dart';


class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  final PersistentTabController _controller =
  PersistentTabController(initialIndex: 0);
  List alertCount = [0, 0, 0];
  void addCounter(int index) {
    setState(() {
      alertCount[index]++;
    });
  }

  void removeCounter(int index) {
    if (alertCount[index] > 0) {
      setState(() {
        alertCount[index]--;
      });
    }
  }

  List<Widget> _buildScreens() => List.generate(
    3,
        (index) => CountState(
        count: alertCount[index],
        addCounter: () => addCounter(index),
        removeCounter: () => removeCounter(index),
        child: Screen(index: index,)),
  );

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: iconBuilder(Icons.notifications, alertCount[0]),
        title: ("Notifications"),
      ),
      PersistentBottomNavBarItem(
        icon: iconBuilder(Icons.shopping_cart, alertCount[1]),
        title: ("Cart"),
      ),
      PersistentBottomNavBarItem(
        icon: iconBuilder(Icons.favorite, alertCount[2]),
        title: ("Favourites"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
      NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }

  Widget iconBuilder(IconData icon, int value) {
    return Stack(
      children: [
        Icon(icon),
        (value) != 0 ? Positioned(
          right: 0,
          top: 0,
          child: Container(
            height: 15,
            width: 15,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red
            ),
            child: Text('$value', style: const TextStyle(fontSize: 8, color: Colors.white),).wrapCenter(),
          ),
        ) : const SizedBox.shrink()
      ],
    );
  }
}


