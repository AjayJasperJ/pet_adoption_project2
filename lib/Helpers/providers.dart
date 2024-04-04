
import 'package:pet_adoption_carmel/screens/BottomNavigationScreen/bottomnavigtionprovider.dart';
import 'package:pet_adoption_carmel/screens/CategoryScreen/provider/categoryeachprovider.dart';
import 'package:pet_adoption_carmel/screens/CategoryScreen/provider/categoryprovider.dart';
import 'package:pet_adoption_carmel/screens/PetFavouriteScreen/provider/petfavprovider.dart';
import 'package:pet_adoption_carmel/screens/PetViewScreen/provider/petprovider.dart';
import 'package:pet_adoption_carmel/screens/ProfileScreen/provider/userprovider.dart';
import 'package:pet_adoption_carmel/screens/ViewOrdersScreen/provider/orderprovider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> multiprovider = [
  ChangeNotifierProvider(create: (context) => PetProvider()),
  ChangeNotifierProvider(create: (context) => FavouriteProvider()),
  ChangeNotifierProvider(create: (context)=>BottomNavigationBarProvider()),
  ChangeNotifierProvider(create: (context)=>CategoryProvider()),
  ChangeNotifierProvider(create: (context)=>CategoryEachProvider()),
  ChangeNotifierProvider(create: (context)=>OrderProvider()),
  ChangeNotifierProvider(create: (context)=>UserProvider())
];
