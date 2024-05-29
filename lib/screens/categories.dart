import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/category_dto.dart';
import '../models/meal.dart';
import '../screens/meals.dart';
import '../widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.avaiableMeals,
  });

  final List<Meal> avaiableMeals;

  void _selectCateogry(BuildContext context, CategoryDTO categoryDTO) {
    final filteredMeals = avaiableMeals
        .where((meal) => meal.categories.contains(categoryDTO.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: categoryDTO.title,
          meals: filteredMeals,
        ),
      ),
    ); // Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children:
          // Use Map
          // availableCategories
          //     .map((e) => CategoryGridItem(categoryDTO: e))
          //     .toList()
          [
        for (final category in availableCategories)
          CategoryGridItem(
            categoryDTO: category,
            onSelectCategory: () {
              _selectCateogry(context, category);
            },
          ),
      ],
    );
  }
}
