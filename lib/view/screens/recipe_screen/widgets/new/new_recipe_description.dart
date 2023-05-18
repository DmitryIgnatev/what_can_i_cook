import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../blocs/recipe/bloc/recipe_bloc.dart';
import '../../../../../utils/constants.dart';

class NewRecipeDescription extends StatelessWidget {
  const NewRecipeDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          return Column(children: [
            const SizedBox(height: 10),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: TextFormField(
                initialValue: state.description,
                maxLines: 10,
                cursorColor: AppColors.kPrimaryRedColor,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  fillColor: Theme.of(context).cardColor,
                  filled: true,
                  hintText: 'Опишите развернуто свой рецепт',
                  hintStyle: const TextStyle(
                      color: AppColors.kTextLigntColor, fontSize: 16),
                ),
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.w500,
                  color: AppColors.kTextColor,
                ),
                onChanged: (String value) {
                  context
                      .read<RecipeBloc>()
                      .add(RecipeDescriptionEvent(description: value));
                },
              ),
            ),
          ]);
        },
      ),
    );
  }
}
