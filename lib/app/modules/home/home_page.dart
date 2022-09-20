import 'package:adf_cuidapet/app/core/life_cycle/page_life_cycle_state.dart';
import 'package:adf_cuidapet/app/core/rest_client/rest_client.dart';
import 'package:adf_cuidapet/app/entities/address_entity.dart';
import 'package:adf_cuidapet/app/modules/home/home_controller.dart';
import 'package:adf_cuidapet/app/services/address/address_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends PageLifeCycleState<HomeController, HomePage> {
  AddressEntity? addressEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: const Center(child: Text('logout')),
          ),
          TextButton(
            onPressed: () async {
              final categoriesResponse = await Modular.get<RestClient>()
                  .auth()
                  .get('/categories/'); //teste acessar categorias

              debugPrint(categoriesResponse.data);
            },
            child: const Center(child: Text('Teste Refresh Token')),
          ),
          TextButton(
            onPressed: () async {
              await Modular.to.pushNamed('/address/');
            },
            child: const Center(child: Text('Ir para endereço')),
          ),
          TextButton(
            onPressed: () async {
              final address =
                  await Modular.get<AddressService>().getAddressSelected();
              setState(() {
                addressEntity = address;
              });
            },
            child: const Center(
              child: Text('Buscar endereço'),
            ),
          ),
          Text(addressEntity?.address ?? 'Nenhun endereço selecionado'),
          Text(addressEntity?.additional ?? 'Nenhun complememto selecionado'),
        ],
      ),
    );
  }
}
