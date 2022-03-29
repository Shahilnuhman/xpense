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
         return  Card(
           child: ListTile(
            
             title: Text('15000'),
             subtitle: Text("expense"),
             trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
            )
           ),
         );
       },
       separatorBuilder: (context, index) {
         return const SizedBox(height: 10);
       },
     );
  }
}