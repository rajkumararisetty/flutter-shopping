import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/cart_screen.dart';

import '../widgets/products_grid.dart';
import '../widgets/badge.dart';

import '../providers/cart.dart';

enum FilterOptions {
  favorites,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavoriesData = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Shop'),
          actions: [
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.favorites) {
                    _showOnlyFavoriesData = true;
                  } else {
                    _showOnlyFavoriesData = false;
                  }
                });
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                const PopupMenuItem(
                    child: Text('Only Favories'),
                    value: FilterOptions.favorites),
                const PopupMenuItem(
                    child: Text('Show All'), value: FilterOptions.all)
              ],
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            Consumer<Cart>(
              builder: (_, cart, __) => Badge(
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                ),
                value: cart.itemCount.toString(),
                color: Colors.red,
              ),
            )
          ],
        ),
        body: ProductsGrid(_showOnlyFavoriesData));
  }
}
