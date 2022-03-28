import 'package:flutter/material.dart';
import 'package:xpens/screens/category/screen_category.dart';
import 'package:xpens/screens/home/widgets/bottom_navigation.dart';
import 'package:xpens/screens/transaction/screen_transaction.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);

  static ValueNotifier<int> selectedIndexnotifier = ValueNotifier(0);

  final pages = const [
    ScreenCategory(),
    ScreenTransaction(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:ValueListenableBuilder(
        valueListenable: selectedIndexnotifier,
        builder: (BuildContext context, int updatedindex, Widget? _){
          return pages[updatedindex];
        },
      )),
      bottomNavigationBar: XpensBottomNavigation(),
    );
  }
}
