import 'package:flutter/material.dart';
import 'package:xpens/database/category/category_db.dart';
import 'package:xpens/screens/category/expenseCategory.dart';
import 'package:xpens/screens/category/incomeCtegory.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({Key? key}) : super(key: key);

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
   
   CategoryDb().getCategories().then((value) {
     print(" category get");
     print(value.toString());
   });
     
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       TabBar(
         labelColor: Colors.black,
         unselectedLabelColor: Colors.grey,
         controller: _tabController,
         tabs: const [
         Tab(text: 'Income'),
         Tab(text: 'Expense'),
       ],
       ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              incomeCategory(),
             expenseCategory()
            ],
          ),
        ),
     ],
   );
  }
}




