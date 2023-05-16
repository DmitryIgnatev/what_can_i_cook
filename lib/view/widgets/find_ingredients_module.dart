import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_can_i_cook/blocs/filtered_items/bloc/filtered_items_bloc.dart';
import 'package:what_can_i_cook/services/firebase/firestore.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import '../../../../models/ingredient.dart';
import '../screens/main_screen/add/widgets/add_ingredient.dart';

class FindIngreidentsModule extends StatelessWidget {
  final bool isAddButtonEnabled;
  final void Function() onItemTap;
  const FindIngreidentsModule(
      {super.key, required this.onItemTap, this.isAddButtonEnabled = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredItemsBloc, FilteredItemsState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                    child: GestureDetector(
                      onTap: () {
                        context.read<FilteredItemsBloc>().add(
                            FilteredItemChosedEvent(
                                ingredient: state.items[index]));
                        onItemTap();
                      },
                      child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              border: Border.all(
                                  color: AppColors.kPrimaryRedColor)),
                          child: Center(
                              child: Text(
                            state.items[index].ingredient,
                            style: TextStyle(
                                color: AppColors.kPrimaryRedColor,
                                fontWeight: FontWeight.bold),
                          ))),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                isAddButtonEnabled
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => AddIngredient(),
                            );
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: AppColors.kBlueColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                )),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                Expanded(
                  child: StreamBuilder<List<Ingredient>>(
                    stream: ReadStore().readIngredients(),
                    builder: (BuildContext context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                            child: Text(
                          'Функция недоступна',
                        ));
                      } else {
                        final items = snapshot.data!;
                        return TextField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            fillColor: Theme.of(context).cardColor,
                            filled: true,
                            hintText: 'Ингридиенты',
                            hintStyle: const TextStyle(
                                color: AppColors.kTextLigntColor, fontSize: 16),
                          ),
                          onChanged: (value) {
                            context.read<FilteredItemsBloc>().add(
                                FilteredItemsChangedEvent(
                                    items: items
                                        .where((item) => item.ingredient
                                            .toLowerCase()
                                            .contains(value.toLowerCase()))
                                        .toList()));
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
