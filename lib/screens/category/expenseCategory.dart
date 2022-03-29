import 'package:flutter/material.dart';

class expenseCategory extends StatelessWidget {
  const expenseCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
       itemCount: 10,
       padding: const EdgeInsets.all(8),
       itemBuilder: (context, index) {
         return const Card(
           child: ListTile(
            
             title: Text('15000'),
             subtitle: Text("expense"),
           ),
         );
       },
       separatorBuilder: (context, index) {
         return const SizedBox(height: 10);
       },
     );
  }
}