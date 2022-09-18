import 'package:adf_cuidapet/app/models/place_model.dart';
import 'package:adf_cuidapet/app/repositories/address/address_repository.dart';

import './address_service.dart';

class AddressServiceImpl implements AddressService {
  final AddressRepository _addressRepository;

  AddressServiceImpl({required AddressRepository addressRepository})
      : _addressRepository = addressRepository;

  @override
  Future<List<PlaceModel>> findAddressByGooglePlaces(String addressPattern) =>
      _addressRepository.findAddressByGooglePlaces(addressPattern);
}
