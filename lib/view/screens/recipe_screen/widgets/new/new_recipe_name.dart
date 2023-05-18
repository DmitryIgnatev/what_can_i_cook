import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../blocs/recipe/bloc/recipe_bloc.dart';
import '../../../../../utils/constants.dart';

class NewRecipeName extends StatelessWidget {
  const NewRecipeName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        return SizedBox(
          height: 30,
          child: TextFormField(
            initialValue: state.name,
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
              hintText: 'Название рецепта',
              hintStyle: const TextStyle(
                  color: AppColors.kTextLigntColor, fontSize: 20),
            ),
            onChanged: (String value) {
              context.read<RecipeBloc>().add(RecipeNameEvent(name: value));
            },
          ),
        );
      },
    );
  }
}
