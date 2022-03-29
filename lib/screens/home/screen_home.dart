import 'package:flutter/material.dart';
import 'package:xpens/database/category/category_db.dart';
import 'package:xpens/models/category/category_model.dart';
import 'package:xpens/screens/category/category_add_pop.dart';
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
            showCategoryAddPopup(context);
            // final _sampledata = CategoryModel(
            //   id: DateTime.now().millisecondsSinceEpoch.toString(),
            //   name: 'travel',
            //   type: Categorytype.expense,
            // );
            // CategoryDb().insertCategory(_sampledata);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
