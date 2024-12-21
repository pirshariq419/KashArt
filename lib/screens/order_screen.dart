import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders_provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrdersProvider>(context);
    final orders = ordersProvider.orders;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: orders.isEmpty
          ? const Center(
        child: Text('No orders found!', style: TextStyle(fontSize: 18)),
      )
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (ctx, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ExpansionTile(
              title: Text(
                'Order #${index + 1} - \$${order.totalAmount.toStringAsFixed(2)}',
              ),
              subtitle: Text(
                'Placed on: ${order.date.toLocal()}',
              ),
              children: order.items.map((item) {
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text('Quantity: ${item.quantity}'),
                  trailing: Text('\$${item.price.toStringAsFixed(2)}'),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
