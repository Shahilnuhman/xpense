import 'package:flutter/material.dart';
import 'package:xpens/models/category/category_model.dart';

Future<void> showCategoryAddPopup(BuildContext context) async {
  showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text("Add Category"),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Category Name",
                  ),
                ),
              ),
              Row(
                children: [
                  Radiobutton(title:' income', type: Categorytype.income),
                  Radiobutton(title:' expense', type: Categorytype.expense)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    ElevatedButton(onPressed: () {}, child: const Text("add")),
              )
            ]);
      });
}

class Radiobutton extends StatefulWidget {

  final String title;
  final Categorytype type;

  const Radiobutton({Key? key,required this.title,required this.type}) : super(key: key);

  @override
  State<Radiobutton> createState() => _RadiobuttonState();
}

class _RadiobuttonState extends State<Radiobutton> {

  Categorytype? _type;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<Categorytype>(
          value: widget.type,
          groupValue: _type ,
          onChanged: (value) {
            setState(() {
              _type=value;
            });
          },
        ),
        Text(widget.title),
      ],
    );
  }
}
