import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_can_i_cook/blocs/recipe/bloc/recipe_bloc.dart';
import 'package:what_can_i_cook/utils/constants.dart';

class NewRecipeTime extends StatelessWidget {
  const NewRecipeTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Время приготовления: ',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.kTextLigntColor,
                        ),
                      ),
                      Text(
                        'ч:${state.hours} мин: ${state.minutes}',
                        style: const TextStyle(
                          color: AppColors.kTextLigntColor,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 50,
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                            itemCount: 60,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                context.read<RecipeBloc>().add(
                                      RecipeHoursEvent(hours: index),
                                    );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(bottom: 3),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: state.hours == index
                                        ? AppColors.kPrimaryRedColor
                                        : AppColors.kTextLigntColor,
                                  ),
                                  color: state.hours == index
                                      ? const Color.fromARGB(
                                          255,
                                          235,
                                          235,
                                          235,
                                        )
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  '$index',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: state.hours == index
                                        ? AppColors.kPrimaryRedColor
                                        : AppColors.kTextLigntColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        height: 60,
                        width: 50,
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                            itemCount: 60,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                context.read<RecipeBloc>().add(
                                      RecipeMinutesEvent(minutes: index),
                                    );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(bottom: 2),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: state.minutes == index
                                        ? AppColors.kPrimaryRedColor
                                        : AppColors.kTextLigntColor,
                                  ),
                                  color: state.minutes == index
                                      ? const Color.fromARGB(
                                          255,
                                          235,
                                          235,
                                          235,
                                        )
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  '$index',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: state.minutes == index
                                        ? AppColors.kPrimaryRedColor
                                        : AppColors.kTextLigntColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
