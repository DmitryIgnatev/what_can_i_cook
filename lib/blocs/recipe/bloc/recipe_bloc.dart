import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeState.initial()) {
    on<RecipeNameEvent>(_onNameChanged);
    on<RecipeAddIngredientsEvent>(_onAddIngridients);
    on<RecipeDeleteIngredientsEvent>(_onDeleteIngredients);
    on<RecipeTimeEvent>(_onTimeChanged);
    on<RecipeDescriptionEvent>(_onDescriptionChanged);
    on<RecipePicUrlEvent>(_onPicUrlChanged);
  }

  void _onNameChanged(RecipeNameEvent event, Emitter<RecipeState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _onAddIngridients(
      RecipeAddIngredientsEvent event, Emitter<RecipeState> emit) {
    emit(state.copyWith(
        ingredients: List.from(state.ingredients)..add(event.ingredient)));
  }

  void _onDeleteIngredients(
      RecipeDeleteIngredientsEvent event, Emitter<RecipeState> emit) {
    emit(state.copyWith(
        ingredients: List.from(state.ingredients)..remove(event.ingredient)));
  }

  void _onTimeChanged(RecipeTimeEvent event, Emitter<RecipeState> emit) {
    emit(state.copyWith(minutes: event.minutes));
  }

  void _onDescriptionChanged(
      RecipeDescriptionEvent event, Emitter<RecipeState> emit) {
    emit(state.copyWith(description: event.description));
  }

  void _onPicUrlChanged(RecipePicUrlEvent event, Emitter<RecipeState> emit) {
    emit(state.copyWith(pictireUrl: event.pictureUrl));
  }
}
