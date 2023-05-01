import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ecommerceui/constants/colors.dart';
import 'package:ecommerceui/pages/mainpage.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _page = 0;

  final _pageController = PageController();

  /// widget list
  final List<Widget> bottomBarPages = [
    HomePage(),
    MainPage(),
  ];
  int maxCount = 5;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  final iconList = <IconData>[
    Icons.home,
    Icons.search,
    Icons.favorite_border_outlined,
    Icons.person_outline_outlined,
  ];
  var _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Button,
        child: Icon(
          Icons.document_scanner_outlined,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        onPressed: () {},
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? Container(
              color: Colors.transparent,
              child: AnimatedBottomNavigationBar(
                leftCornerRadius: 25,
                backgroundColor: primaryColor,
                rightCornerRadius: 25,
                icons: iconList,
                activeIndex: _bottomNavIndex,
                gapLocation: GapLocation.center,
                notchSmoothness: NotchSmoothness.softEdge,
                splashColor: Button,
                inactiveColor: Colors.white,
                shadow: BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                ),
                activeColor: Button,
                onTap: (index) {
                  /// control your animation using page controller
                  setState(
                    () {
                      _bottomNavIndex = index;
                    },
                  );
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                    curve: Curves.easeIn,
                  );
                },
              ),
            )
          : null,
    );
  }
}
