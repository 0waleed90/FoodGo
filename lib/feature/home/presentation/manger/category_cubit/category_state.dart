import '../../../data/model/food_model/food_model.dart';

abstract class CategoryState {
}
class CategoryInitial extends CategoryState{}
class CategoryLoading extends CategoryState{}

class CategorySuccess extends CategoryState {
  final List<String> categories;

  CategorySuccess({required this.categories});

}
class CategoryFailure extends CategoryState{

  final String errorMessage;

  CategoryFailure({required this.errorMessage});

}

