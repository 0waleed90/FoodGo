import 'package:dartz/dartz.dart';
import 'package:delivery/core/errors/failure.dart';
import 'package:delivery/feature/home/data/model/food_model/food_model.dart';

abstract class FoodRepo {
Future<Either<Failures,List<FoodModel>>> fetchFoods();
Future<Either<Failures,List<String>>> fetchAllCategory();

}