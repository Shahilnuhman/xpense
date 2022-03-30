import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:xpens/models/category/category_model.dart';

const CATEGORY_DB_NAME = 'category_db';

abstract class CategoryDbFunction {
  Future<List<CategoryModel>> getCategories();

  Future<void> insertCategory(CategoryModel value);
}

class CategoryDb implements CategoryDbFunction {
  ValueNotifier<List<CategoryModel>> incomecategorylist = ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> expensecategorylist = ValueNotifier([]);

  @override
  Future<void> insertCategory(CategoryModel value) async {
    Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    _categoryDB.add(value);
    refreshUI();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    return _categoryDB.values.toList();
  }

  Future<void> refreshUI() async {
    final _allcategories = await getCategories();
    incomecategorylist.value.clear();
    expensecategorylist.value.clear();

    Future.forEach(_allcategories, (CategoryModel category) {
      if (category.type == Categorytype.expense) {
        incomecategorylist.value.add(category);
      } else {
        expensecategorylist.value.add(category);
      }
    });
    incomecategorylist.notifyListeners();
    expensecategorylist.notifyListeners();

  }
}
