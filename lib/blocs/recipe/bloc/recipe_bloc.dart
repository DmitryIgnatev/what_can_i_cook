import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeState.initial()) {
    on<RecipeNameEvent>(_onNameChanged);
    on<RecipeAddIngredientsEvent>(_onAddIngridients);
    on<RecipeDeleteIngredientsEvent>(_onDeleteIngredients);
    on<RecipeMinutesEvent>(_onMinutesChanged);
    on<RecipeHoursEvent>(_onHoursChanged);
    on<RecipeDescriptionEvent>(_onDescriptionChanged);
    on<RecipePicUrlEvent>(_onPicUrlChanged);
    on<RecipeCopyEvent>(_onRecipeCopy);
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

  void _onMinutesChanged(RecipeMinutesEvent event, Emitter<RecipeState> emit) {
    emit(state.copyWith(minutes: event.minutes));
  }

  void _onHoursChanged(RecipeHoursEvent event, Emitter<RecipeState> emit) {
    emit(state.copyWith(hours: event.hours));
  }

  void _onDescriptionChanged(
      RecipeDescriptionEvent event, Emitter<RecipeState> emit) {
    emit(state.copyWith(description: event.description));
  }

  void _onPicUrlChanged(RecipePicUrlEvent event, Emitter<RecipeState> emit) {
    emit(state.copyWith(pictireUrl: event.pictureUrl));
  }

  void _onRecipeCopy(RecipeCopyEvent event, Emitter<RecipeState> emit) {
    emit(state.copyWith(
        name: event.name,
        ingredients: event.ingredients,
        hours: event.hours,
        minutes: event.minutes,
        description: event.description,
        pictireUrl: event.pictureUrl));
  }
}
