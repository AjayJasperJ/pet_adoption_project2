import 'package:flutter/material.dart';
import 'package:pet_adoption_carmel/screens/CategoryScreen/pages/categoryscreen.dart';
import 'package:pet_adoption_carmel/screens/CategoryScreen/pages/petcategoryscreen.dart';
import 'package:pet_adoption_carmel/screens/PetFavouriteScreen/pages/allpetfavouitescreen.dart';
import 'package:pet_adoption_carmel/screens/PetViewScreen/pages/allpetscreen.dart';
import 'package:pet_adoption_carmel/screens/PetViewScreen/pages/petdetailsscreen.dart';
import 'package:pet_adoption_carmel/screens/ViewOrdersScreen/pages/myordersscreen.dart';


var customRoutes = <String, WidgetBuilder>{
    'all_pet_screen': (context) => const AllPetScreen(),
         'pets_details_screen': (context) {
    String id = ModalRoute.of(context)!.settings.arguments.toString();
    return PetDetailsScreen(
      id: id,
    );
  },
  'all_favourites_screen':(context) => AllFavouritesScreen(),
  'all_category_screen':(context) => CategoryScreen(),
  'all_orders_screen':(context) => MyOrdersScreen(),
   'all_categoryproduct_screen': (context) {
    var data = ModalRoute.of(context)!.settings.arguments;
    if (data is String) {
      return PetCategoryScreen(cate: data);
    } else if (data is Map<String, dynamic>) {
      return PetCategoryScreen(cate: data['category_id']);
    } else {
      print('Unexpected argument type: ${data.runtimeType}');
      return const Scaffold(
        body: Center(
          child: Text(''),
        ),
      );
    }
  },
};
