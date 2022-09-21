import 'package:adf_cuidapet/app/models/supplier_category_model.dart';

abstract class SupplierRepository {
  Future<List<SupplierCategoryModel>> getCategories();
}
