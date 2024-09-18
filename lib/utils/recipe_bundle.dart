import 'package:flutter/material.dart';

import 'package:what_can_i_cook/utils/constants.dart';

class RecipeBundle {
  final int id;
  final int chefs;
  final int recipes;
  final String title;
  final String description;
  final String imageSrc;
  final Color color;

  RecipeBundle({
    required this.id,
    required this.chefs,
    required this.recipes,
    required this.title,
    required this.description,
    required this.imageSrc,
    required this.color,
  });
}

// Demo list
List<RecipeBundle> recipeBundles = [
  RecipeBundle(
    id: 1,
    chefs: 16,
    recipes: 95,
    title: 'Готовьте что захотите и когда захотите каждый день',
    description: 'Это очень просто и интересно',
    imageSrc: 'assets/images/cooking_boy.png',
    color: AppColors.kGreenColor,
  ),
  RecipeBundle(
    id: 2,
    chefs: 8,
    recipes: 26,
    title: 'Добавляйте любимые рецепты в избранное',
    description:
        'Вы сможете в люой момент посмотреть список понравившихся вам рецептов',
    imageSrc: 'assets/images/cooking_book.png',
    color: AppColors.kPrimaryRedColor,
  ),
  RecipeBundle(
    id: 3,
    chefs: 10,
    recipes: 43,
    title: 'Делитесь своими рецептами с остальными',
    description: 'Цифровая энциклопедия рецептов',
    imageSrc: 'assets/images/community.png',
    color: AppColors.kBlueColor,
  ),
];
