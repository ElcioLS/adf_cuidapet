import 'dart:async';

import 'package:adf_cuidapet/app/core/ui/extensions/theme_extension.dart';
import 'package:adf_cuidapet/app/models/place_model.dart';
import 'package:adf_cuidapet/app/modules/address/widgets/address_search_widget/address_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

part 'widgets/address_item.dart';
part 'widgets/address_search_widget/address_search_widget.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.primaryColorDark),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                'Adicione ou escolha um endereço',
                style: context.textTheme.headline4?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _AddressSearchWidget(
                addressSelectedCallback: (place) {
                  print(place);
                },
              ),
              const SizedBox(height: 30),
              const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 30,
                  child: Icon(
                    Icons.near_me,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  'Localização Atual',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              const SizedBox(height: 20),
              Column(
                children: const [
                  _AddressItem(),
                  _AddressItem(),
                  _AddressItem(),
                  _AddressItem(),
                  _AddressItem(),
                  _AddressItem(),
                  _AddressItem(),
                  _AddressItem(),
                  _AddressItem(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
