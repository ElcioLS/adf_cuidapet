import 'package:adf_cuidapet/app/models/supplier_category_model.dart';
import 'package:adf_cuidapet/app/repositories/supplier/supplier_repository.dart';

import './supplier_service.dart';

class SupplierServiceImpl implements SupplierService {
  final SupplierRepository _supplierRepository;

  SupplierServiceImpl({required SupplierRepository supplierRepository})
      : _supplierRepository = supplierRepository;

  @override
  Future<List<SupplierCategoryModel>> getCategories() =>
      _supplierRepository.getCategories();
}
