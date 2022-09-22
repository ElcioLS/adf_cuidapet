part of '../home_page.dart';

class _HomeSupplierTab extends StatelessWidget {
  final HomeController homeController;

  const _HomeSupplierTab({required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HomeTabHeader(
          homeController: homeController,
        ),
        Expanded(
          child: Observer(
            builder: (_) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: homeController.supplierPageTypeSelected ==
                        SupplierPageType.list
                    ? _HomeSupplierList(homeController)
                    : _HomeSupplierGrid(homeController),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _HomeTabHeader extends StatelessWidget {
  final HomeController homeController;

  const _HomeTabHeader({required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          const Text('Estabelecimentos'),
          const Spacer(),
          InkWell(
            onTap: () =>
                homeController.changeTapSupplier(SupplierPageType.list),
            child: Observer(
              builder: (_) {
                return Icon(
                  Icons.view_headline,
                  color: homeController.supplierPageTypeSelected ==
                          SupplierPageType.list
                      ? Colors.black
                      : Colors.grey,
                );
              },
            ),
          ),
          InkWell(
            onTap: () =>
                homeController.changeTapSupplier(SupplierPageType.grid),
            child: Observer(
              builder: (_) {
                return Icon(
                  Icons.view_comfy,
                  color: homeController.supplierPageTypeSelected ==
                          SupplierPageType.grid
                      ? Colors.black
                      : Colors.grey,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeSupplierList extends StatelessWidget {
  final HomeController _homeController;
  const _HomeSupplierList(this._homeController);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Observer(
          builder: (_) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: _homeController.listSuppliersByAddress.length,
                  (context, index) {
                final supplier = _homeController.listSuppliersByAddress[index];
                return _HomeSupplierListItemWidget(supplier: supplier);
              }),
            );
          },
        ),
      ],
    );
  }
}

class _HomeSupplierListItemWidget extends StatelessWidget {
  final SupplierNearbyMeModel supplier;

  const _HomeSupplierListItemWidget({required this.supplier});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            width: 1.sw,
            height: 80.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          supplier.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 16,
                            ),
                            Text(
                                '${supplier.distance.toStringAsFixed(2)} Km de distância')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundColor: context.primaryColor,
                    maxRadius: 15,
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(100)),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[100]!,
                  width: 5,
                ),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: NetworkImage(supplier.logo),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _HomeSupplierGrid extends StatelessWidget {
  final HomeController controller;

  const _HomeSupplierGrid(this.controller);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverGrid(
          delegate:
              SliverChildBuilderDelegate(childCount: 10, (context, index) {
            return _HomeSupplierCardItemWidget();
          }),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.1,
          ),
        ),
      ],
    );
  }
}

class _HomeSupplierCardItemWidget extends StatelessWidget {
  const _HomeSupplierCardItemWidget();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin:
              const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 40.0, right: 10, left: 10, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Clinica Central ABC',
                    style: context.textTheme.subtitle2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text(
                    '1.34 Km de distância',
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey[200],
          ),
        ),
        const Positioned(
          top: 4,
          left: 0,
          right: 0,
          child: Center(
            child: CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                  'https://s2.glbimg.com/nvjFq8VRjyrpdQqaOeywz-5DFwY=/e.glbimg.com/og/ed/f/original/2021/08/27/captura_de_tela_2021-08-27_as_11.01.15.png'),
            ),
          ),
        ),
      ],
    );
  }
}
