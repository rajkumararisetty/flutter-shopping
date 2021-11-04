import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;

import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cartContainer = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Title',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '\$${cartContainer.totalAmount}',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    child: Text(
                      'ORDER NOW',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartContainer.itemCount,
              itemBuilder: (ctx, i) => CartItem(
                cartContainer.items.values.toList()[i].id,
                cartContainer.items.values.toList()[i].price,
                cartContainer.items.values.toList()[i].quantity,
                cartContainer.items.values.toList()[i].title,
              ),
            ),
          )
        ],
      ),
    );
  }
}
