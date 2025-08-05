import 'package:core/app_module.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orders/l10n/arb/order_localization.dart';

final _appRoutes = <GoRoute>[
  GoRoute(
    path: _RouteNames.orderRouteName,
    builder: (context, state) => const _OrdersPage(),
  ),
];

class OrderModule extends AppModule {
  @override
  String get key => 'order';

  @override
  NavigationTab? get navigationTab => NavigationTab(
    icon: Icons.menu,
    label: 'Order',
    initialLocation: _RouteNames.orderRouteName,
  );

  @override
  List<RouteBase> get routes => _appRoutes;

  @override
  void init() {
    //Setup your DI here.

    //  Then wherever you're loading your modules (e.g., AppModulesLoader or AppShell), call:
    //  for (final module in appModules) {
    //    module.init();
    //  }
  }

  @override
  LocalizationsDelegate? get localizationDelegate =>
      OrderLocalizations.delegate;
}

class _RouteNames {
  static const String orderRouteName = '/order';
}

class _OrdersPage extends StatelessWidget {
  const _OrdersPage({super.key});

  @override
  Widget build(BuildContext context) => const _OrderPage();
}

class _OrderPage extends StatelessWidget {
  const _OrderPage({super.key});

  final List<Map<String, dynamic>> orders = const [
    {'id': 'ORD001', 'item': 'T-Shirt', 'status': 'Delivered'},
    {'id': 'ORD002', 'item': 'Shoes', 'status': 'Shipped'},
    {'id': 'ORD003', 'item': 'Watch', 'status': 'Processing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Orders')),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(child: Text(order['item'][0])),
              title: Text(order['item']),
              subtitle: Text('Order ID: ${order['id']}'),
              trailing: Text(
                order['status'],
                style: TextStyle(
                  color: order['status'] == 'Delivered'
                      ? Colors.green
                      : order['status'] == 'Shipped'
                      ? Colors.orange
                      : Colors.blue,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
