import 'package:flutter/material.dart';
import 'package:xpens/screens/home/screen_home.dart';

class XpensBottomNavigation extends StatelessWidget {
  const XpensBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ScreenHome.selectedIndexnotifier,
      builder: (BuildContext context, int updatedindex, Widget? _) {
        return BottomNavigationBar(
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          currentIndex: updatedindex,
          onTap: (newIndex) {
            ScreenHome.selectedIndexnotifier.value = newIndex;
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'transaction',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Category',
            ),
          ],
        );
      },
    );
  }
}
