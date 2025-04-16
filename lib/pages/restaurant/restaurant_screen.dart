import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtaste/model/dish.dart';
import 'package:techtaste/model/restaurant.dart';
import 'package:techtaste/pages/_core/bag_provider.dart';
import 'package:techtaste/pages/_core/widgets/appbar_widget.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurant.name),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 12,
          children: [
            Image.asset('assets/${restaurant.imagePath}', width: 128),
            const Text(
              'Mais pedidos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: List.generate(restaurant.dishes.length, (index) {
                Dish dish = restaurant.dishes[index];
                return ListTile(
                  leading: Image.asset('assets/dishes/default.png', width: 48),
                  title: Text(dish.name),
                  subtitle: Text('R\$ ${dish.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                      onPressed: () =>
                          context.read<BagProvider>().addAllDishes([dish]),
                      icon: const Icon(Icons.add)),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
