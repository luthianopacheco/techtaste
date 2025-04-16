import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtaste/data/categories_data.dart';
import 'package:techtaste/data/restaurant_data.dart';
import 'package:techtaste/pages/_core/widgets/appbar_widget.dart';
import 'package:techtaste/pages/home/widgets/category_widget.dart';
import 'package:techtaste/pages/home/widgets/restaurant_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);

    return Scaffold(
      drawer: const Drawer(),
      appBar: getAppBar(context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              Center(
                child: Image.asset(
                  'assets/logo.png',
                  width: 147,
                ),
              ),
              const Text('Boas-vindas!'),
              TextFormField(),
              const Text('Escolha por categoria'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    spacing: 8,
                    children: List.generate(
                        CategoriesData.categoriesList.length,
                        (index) => CategoryWidget(
                            category: CategoriesData.categoriesList[index]))),
              ),
              Image.asset('assets/banners/banner_promo.png'),
              const Text('Bem avaliados'),
              Column(
                spacing: 16,
                children: List.generate(
                    restaurantData.listRestaurant.length,
                    (index) => RestaurantWidget(
                        restaurant: restaurantData.listRestaurant[index])),
              ),
              const SizedBox(height: 64)
            ],
          ),
        ),
      ),
    );
  }
}
