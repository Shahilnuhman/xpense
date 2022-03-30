import 'package:flutter/material.dart';
import 'package:xpens/database/category/category_db.dart';
import 'package:xpens/models/category/category_model.dart';

ValueNotifier<Categorytype>selectedCategorynotifier = ValueNotifier(Categorytype.income);

Future<void> showCategoryAddPopup(BuildContext context) async {
  final _nameEditingController = TextEditingController();
  showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
            title: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Add Category"),
            ),
            children: [
               Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: _nameEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Category Name",
                  ),
                ),
              ),
              Row(
                children: const [
                  Radiobutton(title:' income', type: Categorytype.income),
                  Radiobutton(title:' expense', type: Categorytype.expense)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    ElevatedButton(onPressed: () {
                      final _type = selectedCategorynotifier.value;
                      final _name=_nameEditingController.text;
                      if(_name.isEmpty){
                        return;
                      }
                      final _category = CategoryModel(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        name: _name,
                        type: _type,
                      );
                      CategoryDb().insertCategory(_category);
                      Navigator.of(ctx).pop();

                    }, child: const Text("add")),
              )
            ]);
      });
}

class Radiobutton extends StatelessWidget {

  final String title;
  final Categorytype type;

  const Radiobutton({Key? key,required this.title,required this.type}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(valueListenable: selectedCategorynotifier, builder: (BuildContext ctx, Categorytype newcategory, Widget?_) {
          return Radio<Categorytype>(
          value:type,
          groupValue: newcategory, 
          onChanged: (value) {
            if(value==null){
              return;
            }
            selectedCategorynotifier.value = value;
            selectedCategorynotifier.notifyListeners();

          
            
          },
        );
        }),
        Text(title),
      ],
    );
  }
}
