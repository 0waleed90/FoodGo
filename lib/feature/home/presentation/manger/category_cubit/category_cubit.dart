import 'package:delivery/feature/home/data/repo/food_repo.dart';
import 'package:delivery/feature/home/presentation/manger/category_cubit/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState>{
  CategoryCubit({required this._foodRepo}):super(CategoryInitial());
  final FoodRepo _foodRepo;

  Future<void> getAllCategory()async{
    emit(CategoryLoading());
    var data = await _foodRepo.fetchAllCategory();
    data.fold((failure){
      emit(CategoryFailure(errorMessage: failure.errorMessage));


    }, (categories){
      emit(CategorySuccess(categories: categories));


    });




  }



}