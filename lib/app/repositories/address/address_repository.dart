import 'package:adf_cuidapet/app/models/place_model.dart';

abstract class AddressRepository {
  Future<List<PlaceModel>> findAddressByGooglePlaces(String addressPattern);
}
