import 'package:adf_cuidapet/app/modules/address/address_detail/address_detail_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddressDetailModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => AddressDetailPage(place: args.data),
        ),
      ];
}
