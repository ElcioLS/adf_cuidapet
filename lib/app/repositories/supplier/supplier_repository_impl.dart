import 'package:adf_cuidapet/app/core/exceptions/failure.dart';
import 'package:adf_cuidapet/app/core/logger/app_logger.dart';
import 'package:adf_cuidapet/app/core/rest_client/rest_client.dart';
import 'package:adf_cuidapet/app/core/rest_client/rest_client_exception.dart';
import 'package:adf_cuidapet/app/models/supplier_category_model.dart';

import './supplier_repository.dart';

class SupplierRepositoryImpl implements SupplierRepository {
  final RestClient _restClient;
  final AppLogger _log;

  SupplierRepositoryImpl(
      {required RestClient restClient, required AppLogger log})
      : _restClient = restClient,
        _log = log;

  @override
  Future<List<SupplierCategoryModel>> getCategories() async {
    try {
      final result = await _restClient.auth().get('/categories/');
      return result.data
          ?.map<SupplierCategoryModel>(
            (categoryResponse) =>
                SupplierCategoryModel.fromMap(categoryResponse),
          )
          .toList();
    } on RestClientException catch (e, s) {
      const message = 'Erro ao buscar categorias de fornecedores';
      _log.error(message, e, s);
      throw Failure(message: message);
    }
  }
}
