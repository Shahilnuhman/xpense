import 'package:hive_flutter/adapters.dart';
import 'package:xpens/models/category/category_model.dart';

const CATEGORY_DB_NAME = 'category_db';

abstract class CategoryDbFunction {
  Future <List<CategoryModel>> getCategories();

  Future<void> insertCategory(CategoryModel value);
}

class CategoryDb implements CategoryDbFunction {
  @override
  Future<void> insertCategory(CategoryModel value) async {
    Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    _categoryDB.add(value);
  }

  @override
  Future<List<CategoryModel>> getCategories()async {
  final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
  return _categoryDB.values.toList();
  }
}
