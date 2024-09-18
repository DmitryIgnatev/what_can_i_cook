import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_can_i_cook/blocs/filtered_items/bloc/filtered_items_bloc.dart';
import 'package:what_can_i_cook/blocs/recipe/bloc/recipe_bloc.dart';
import 'package:what_can_i_cook/models/ingredient.dart';
import 'package:what_can_i_cook/services/firebase/firestore.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import 'package:what_can_i_cook/view/screens/main_screen/add/widgets/add_ingredient.dart';

class FindIngreidentsModule extends StatelessWidget {
  final bool isAddButtonEnabled;
  const FindIngreidentsModule({super.key, this.isAddButtonEnabled = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredItemsBloc, FilteredItemsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              SizedBox(
                height: state.items.isEmpty ? 0 : 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: GestureDetector(
                        onTap: () {
                          context.read<RecipeBloc>().add(
                                RecipeAddIngredientsEvent(
                                  ingredient: state.items[index].name,
                                ),
                              );
                        },
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 3),
                                blurRadius: 1,
                                color:
                                    AppColors.kTextLigntColor.withOpacity(0.3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              state.items[index].name,
                              style: const TextStyle(
                                color: AppColors.kTextLigntColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  if (isAddButtonEnabled)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => const AddIngredient(),
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: AppColors.kBlueColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  else
                    const SizedBox(),
                  Expanded(
                    child: StreamBuilder<List<Ingredient>>(
                      stream: ReadStore()
                          .readData('ingredients', Ingredient.fromJson),
                      builder: (BuildContext context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: Text(
                              'Функция недоступна',
                            ),
                          );
                        } else {
                          final items = snapshot.data!;
                          return TextField(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              fillColor: Theme.of(context).cardColor,
                              filled: true,
                              hintText: 'Ингредиенты',
                              hintStyle: const TextStyle(
                                color: AppColors.kTextLigntColor,
                                fontSize: 16,
                              ),
                            ),
                            onChanged: (value) {
                              context.read<FilteredItemsBloc>().add(
                                    FilteredItemsChangedEvent(
                                      items: items
                                          .where(
                                            (item) => item.name
                                                .toLowerCase()
                                                .contains(value.toLowerCase()),
                                          )
                                          .toList(),
                                    ),
                                  );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              BlocBuilder<RecipeBloc, RecipeState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: state.ingredients.length,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 120,
                              mainAxisExtent: 50,
                            ),
                            itemBuilder: (context, index) {
                              final item = state.ingredients[index];
                              return Padding(
                                padding: const EdgeInsets.all(4),
                                child: DecoratedBox(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(width: 50, child: Text(item)),
                                        GestureDetector(
                                          onTap: () {
                                            context.read<RecipeBloc>().add(
                                                  RecipeDeleteIngredientsEvent(
                                                    ingredient: item,
                                                  ),
                                                );
                                          },
                                          child: const Icon(
                                            Icons.close,
                                            size: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
