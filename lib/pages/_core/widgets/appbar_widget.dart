import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtaste/pages/_core/bag_provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:techtaste/pages/checkout/checkout_screen.dart';

AppBar getAppBar({required BuildContext context, String? title}) {
  BagProvider bagProvider = Provider.of<BagProvider>(context);
  return AppBar(
    title: title != null ? Text(title) : null,
    centerTitle: true,
    actions: [
      badges.Badge(
        showBadge: bagProvider.dishesOnBag.isNotEmpty,
        position: badges.BadgePosition.bottomStart(start: 0, bottom: 0),
        badgeContent: Text(
          bagProvider.dishesOnBag.length.toString(),
          style: const TextStyle(fontSize: 10),
        ),
        child: IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CheckoutScreen(),
                )),
            icon: const Icon(Icons.shopping_basket)),
      )
    ],
  );
}
