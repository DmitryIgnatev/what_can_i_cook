import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../blocs/recipe/bloc/recipe_bloc.dart';
import '../../../../../utils/constants.dart';

class NewRecipeTime extends StatelessWidget {
  const NewRecipeTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        return SizedBox(
          height: 20,
          child: TextFormField(
            initialValue: "${state.minutes}",
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
              hintText: 'Время на приготовление',
              hintStyle: const TextStyle(
                  color: AppColors.kTextLigntColor, fontSize: 12),
            ),
            onChanged: (String value) {
              context
                  .read<RecipeBloc>()
                  .add(RecipeTimeEvent(minutes: int.parse(value)));
            },
          ),
        );
      },
    );
  }
}
