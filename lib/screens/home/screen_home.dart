import 'package:flutter/material.dart';
import 'package:xpens/screens/category/screen_category.dart';
import 'package:xpens/screens/home/widgets/bottom_navigation.dart';
import 'package:xpens/screens/transaction/screen_transaction.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);

  static ValueNotifier<int> selectedIndexnotifier = ValueNotifier(0);

  final pages = const [
    ScreenTransaction(),
    ScreenCategory(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Center(child: const Text('Xpens')),
      ),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: selectedIndexnotifier,
        builder: (BuildContext context, int updatedindex, Widget? _) {
          return pages[updatedindex];
        },
      )),
      bottomNavigationBar: XpensBottomNavigation(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexnotifier.value == 0) {
            print("transaction");
          } else {
            print("category");
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
