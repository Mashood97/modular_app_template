import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) =>
      const OrderPage();
}

final routes = <GoRoute>[
  GoRoute(path: '/orders', builder: (context, state) => const OrdersPage()),
];

final BottomNavigationBarItem tab = BottomNavigationBarItem(
  icon: Icon(Icons.menu),
  label: 'Orders',
);





class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  final List<Map<String, dynamic>> orders = const [
    {'id': 'ORD001', 'item': 'T-Shirt', 'status': 'Delivered'},
    {'id': 'ORD002', 'item': 'Shoes', 'status': 'Shipped'},
    {'id': 'ORD003', 'item': 'Watch', 'status': 'Processing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(order['item'][0]),
              ),
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
