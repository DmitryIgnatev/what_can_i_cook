import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_can_i_cook/blocs/recipe/bloc/recipe_bloc.dart';
import 'package:what_can_i_cook/models/category.dart';
import 'package:what_can_i_cook/services/firebase/firestore.dart';
import 'package:what_can_i_cook/utils/constants.dart';

class NewCategoryList extends StatelessWidget {
  const NewCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Row(
            children: [
              const Text(
                'Категория:',
                style: TextStyle(
                  color: AppColors.kTextLigntColor,
                  fontSize: 24,
                ),
              ),
              Expanded(
                child: StreamBuilder<List<RecipeCategory>>(
                  stream: ReadStore()
                      .readData('categories', RecipeCategory.fromJson),
                  builder: (BuildContext context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text(
                          'Нет записей',
                        ),
                      );
                    } else {
                      final categories = snapshot.data!;
                      return SizedBox(
                        height: 35,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            final String widgetCategory =
                                categories[index].name;
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: GestureDetector(
                                onTap: () {
                                  context.read<RecipeBloc>().add(
                                        RecipeCategoryEvent(
                                          category: widgetCategory,
                                        ),
                                      );
                                },
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: state.category == widgetCategory
                                          ? AppColors.kPrimaryRedColor
                                          : AppColors.kTextLigntColor,
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        categories[index].name,
                                        style: TextStyle(
                                          color:
                                              state.category == widgetCategory
                                                  ? AppColors.kPrimaryRedColor
                                                  : AppColors.kTextLigntColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
