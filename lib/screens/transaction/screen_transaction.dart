import 'package:flutter/material.dart';

class ScreenTransaction extends StatelessWidget {
  const ScreenTransaction({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return const Card(
       child: ListTile(
         
         leading: CircleAvatar(
           radius: 30,
           child: Text('12\ndec'),
         ),
         title: Text('15000'),
         subtitle: Text("salary"),
       ),);
     
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
    );

    
  }
}