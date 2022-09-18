part of '../address_page.dart';

class _AddressSearchWidget extends StatefulWidget {
  const _AddressSearchWidget({Key? key}) : super(key: key);

  @override
  State<_AddressSearchWidget> createState() => _AddressSearchWidgetState();
}

class _AddressSearchWidgetState extends State<_AddressSearchWidget> {
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide:
          const BorderSide(style: BorderStyle.none, color: Colors.black),
    );
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(20),
      child: TypeAheadField<PlaceModel>(
        textFieldConfiguration: TextFieldConfiguration(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.location_on),
            hintText: 'Insira um endereço',
            border: border,
            disabledBorder: border,
            enabledBorder: border,
          ),
        ),
        itemBuilder: (_, item) {
          return _ItemTile(
            address: item.address,
          );
        },
        onSuggestionSelected: _onSuggestionSelected,
        suggestionsCallback: _onSuggestionCallback,
      ),
    );
  }

  FutureOr<Iterable<PlaceModel>> _onSuggestionCallback(String pattern) {
    debugPrint('endereço digitado $pattern ');

    return [
      PlaceModel(address: 'Av Paulista, 200', lat: 123.0, lng: 12154.0),
      PlaceModel(address: 'Av Paulista, 500', lat: 123.0, lng: 12154.0),
      PlaceModel(address: 'Av Paulista, 1500', lat: 123.0, lng: 12154.0),
    ];
  }

  void _onSuggestionSelected(PlaceModel suggestion) {
    print(suggestion);
  }
}

class _ItemTile extends StatelessWidget {
  final String address;

  const _ItemTile({required this.address});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.location_on),
      title: Text(address),
    );
  }
}
