import 'package:delivery/feature/home/data/repo/food_repo.dart';
import 'package:delivery/feature/home/presentation/manger/food_cubit/food_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit({required this._foodRepo}) : super(FoodInitial());
  final FoodRepo _foodRepo;
  Future<void> fetchFood() async {
    emit(FoodLoading());

    var response = await _foodRepo.fetchFoods();
    response.fold(
      (failure) {
        emit(FoodFailure(errorMessage: failure.errorMessage));
      },
      (foods) {
        emit(FoodSuccess(foods: foods));
      },
    );



  }

}
