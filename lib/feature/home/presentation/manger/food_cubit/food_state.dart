import '../../../data/model/food_model/food_model.dart';

abstract class FoodState {
}
class FoodInitial extends FoodState{}
class FoodLoading extends FoodState{}

class FoodSuccess extends FoodState {
  final List<FoodModel> foods;

  FoodSuccess({required this.foods});

    }
    class FoodFailure extends FoodState{

  final String errorMessage;

  FoodFailure({required this.errorMessage});

    }

