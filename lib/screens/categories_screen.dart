import 'package:flutter/material.dart';
import 'package:meal/widgets/category_item.dart';
import 'package:meal/dummy_data.dart';

class CatergoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final routeArgs =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    // final categoryId = routeArgs['id'];
    // final categoryTitle = routeArgs['title'];

    return GridView(
      padding: const EdgeInsets.all(20.0),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(catData.id, catData.title, catData.color),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
