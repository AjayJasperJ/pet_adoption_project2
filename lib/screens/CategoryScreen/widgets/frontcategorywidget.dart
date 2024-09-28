import 'package:flutter/material.dart';
import 'package:pet_adoption_carmel/screens/CategoryScreen/pages/petcategoryscreen.dart';


class FrontCategoryWidegt extends StatefulWidget {
  final String id;
  final String image;
  const FrontCategoryWidegt({super.key,required this.id,required this.image});

  @override
  State<FrontCategoryWidegt> createState() => _FrontCategoryWidegtState();
}

class _FrontCategoryWidegtState extends State<FrontCategoryWidegt> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () {
           Navigator.of(context)
                .pushNamed(PetCategoryScreen.routeName ,arguments:widget.id);
        },
        child: Container(
                        height: 120,
                        width: 90,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(widget.image),fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                        
                        ),
                        
                      ),
      ),
    );
  } 
}