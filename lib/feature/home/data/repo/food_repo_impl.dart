import 'package:dartz/dartz.dart';
import 'package:delivery/core/errors/failure.dart';
import 'package:delivery/feature/home/data/model/food_model/food_model.dart';
import 'package:delivery/feature/home/data/repo/food_repo.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/api_service.dart';

class FoodRepoImpl implements FoodRepo {
  final ApiService apiService;

  FoodRepoImpl({required this.apiService});
  @override
  Future<Either<Failures, List<FoodModel>>> fetchFoods() async {
    try {
      var data = await apiService.getResponse('recipes');

      final List<FoodModel> foods = [];
      for (var item in data['recipes']) {
        foods.add(FoodModel.fromJson(item));
      }
      return right(foods);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<String>>> fetchAllCategory() async {
    try {
      var data = await apiService.getResponse('recipes/tags');

      final List<String> categories = [];
      for (var item in data) {
        categories.add(item);
      }
      return right(categories);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<FoodModel>>> foodSearch(String query) async {
    try {
      var data = await apiService.getResponse('recipes/search?q=$query');
      final List<FoodModel> searchResult = [];
      for (var item in data['recipes']) {
        searchResult.add(FoodModel.fromJson(item));
      }
      return right(searchResult);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<FoodModel>>> fetchFoodByCategory(
    String category,
  ) async {
    try {
      var data = await apiService.getResponse('recipes/tag/$category');

      final List<FoodModel> foods = [];
      for (var item in data['recipes']) {
        foods.add(FoodModel.fromJson(item));
      }
      return right(foods);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
