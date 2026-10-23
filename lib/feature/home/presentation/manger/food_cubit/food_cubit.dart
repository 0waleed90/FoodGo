import 'package:delivery/core/utils/constants.dart';
import 'package:delivery/feature/home/data/model/food_model/food_model.dart';
import 'package:delivery/feature/home/data/repo/food_repo.dart';
import 'package:delivery/feature/home/presentation/manger/food_cubit/food_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class FoodCubit extends Cubit<FoodState> {
  List<String> allCategories = [];

  FoodCubit({required this._foodRepo}) : super(FoodInitial());
  final FoodRepo _foodRepo;
  List<FoodModel> cartItems = [];
  List<FoodModel> allFoods = [];
  Future<void> fetchFood() async {
    emit(FoodLoading());

    var response = await _foodRepo.fetchFoods();
    response.fold(
      (failure) {
        emit(FoodFailure(errorMessage: failure.errorMessage));
      },
      (foods) {
        allFoods = foods;
        emit(
          FoodSuccess(
            foods: foods,
            cartItems: cartItems,
            categories: allCategories,
          ),
        );
      },
    );
  }

  void addToCart(
    int id,
    String name,
    String image,
    double rating,
    num price,
    int reviewCount,
    List<String> instructions,
  ) {
    int existingIndex = cartItems.indexWhere((element) => element.id == id);
    if (existingIndex != -1) {
      cartItems[existingIndex].quantity++;
    } else {
      cartItems.add(
        FoodModel(
          name: name,
          id: id,
          image: image,
          rating: rating,
          price: price,
          reviewCount: reviewCount,
          instructions: instructions,
        ),
      );
    }
    Hive.box(
      kBasicBox,
    ).put(kCartItemBox, cartItems.map((e) => e.toJson()).toList());
    emit(
      FoodSuccess(
        foods: allFoods,
        cartItems: cartItems,
        categories: allCategories,
      ),
    );
  }

  void removeFromCart(int id) {
    cartItems.removeWhere((e) => e.id == id);
    Hive.box(
      kBasicBox,
    ).put(kCartItemBox, cartItems.map((e) => e.toJson()).toList());
    emit(
      FoodSuccess(
        foods: allFoods,
        cartItems: cartItems,
        categories: allCategories,
      ),
    );
  }

  void clearCartItems() {
    cartItems = [];
    Hive.box(
      kBasicBox,
    ).put(kCartItemBox, cartItems.map((e) => e.toJson()).toList());
    emit(
      FoodSuccess(
        foods: allFoods,
        cartItems: cartItems,
        categories: allCategories,
      ),
    );
  }

  void getCartItems() {
    try {
      var rawData =
          Hive.box(kBasicBox).get(kCartItemBox, defaultValue: []) as List;
      cartItems = rawData
          .map((e) => FoodModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    } catch (e) {
      cartItems = [];
      Hive.box(kBasicBox).delete(kCartItemBox);
    }
    emit(
      FoodSuccess(
        foods: allFoods,
        cartItems: cartItems,
        categories: allCategories,
      ),
    );
  }

  void increaseCartItemCount(int index) {
    if (index >= 0 && index < cartItems.length) {
      cartItems[index].quantity++;
      Hive.box(
        kBasicBox,
      ).put(kCartItemBox, cartItems.map((e) => e.toJson()).toList());
      emit(
        FoodSuccess(
          foods: allFoods,
          cartItems: cartItems,
          categories: allCategories,
        ),
      );
    }
  }

  void decreaseCartItemCount(int index) {
    if (index >= 0 && index < cartItems.length) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
        Hive.box(
          kBasicBox,
        ).put(kCartItemBox, cartItems.map((e) => e.toJson()).toList());
        emit(
          FoodSuccess(
            foods: allFoods,
            cartItems: List.from(cartItems),
            categories: allCategories,
          ),
        );
      }
    }
  }

  num getTotalPriceOfCartItem() {
    num total = 0;
    for (int i = 0; i < cartItems.length; i++) {
      total += cartItems[i].price * cartItems[i].quantity;
    }
    return total;
  }

  Future<void> getAllCategory() async {
    emit(FoodLoading());
    var data = await _foodRepo.fetchAllCategory();
    data.fold(
      (failure) {
        emit(FoodFailure(errorMessage: failure.errorMessage));
      },
      (categories) {
        allCategories = categories;
        emit(
          FoodSuccess(
            foods: allFoods,
            cartItems: cartItems,
            categories: allCategories,
          ),
        );
      },
    );
  }

  Future<void> getFoodByCategory(String category) async {
    emit(FoodLoading());
    var data = await _foodRepo.fetchFoodByCategory(category);
    data.fold(
      (failure) {
        emit(FoodFailure(errorMessage: failure.errorMessage));
      },
      (foodByCategory) {

        emit(
          FoodSuccess(
            foods: foodByCategory,
            cartItems: cartItems,
            categories: allCategories,
          ),
        );
      },
    );
  }
  void priceFilter(int maxPrice){
    List<FoodModel> filteredFoods = allFoods
        .where((food) => food.price <= maxPrice)
        .toList();
    emit(
      FoodSuccess(
        foods: filteredFoods,
        cartItems: cartItems,
        categories: allCategories,
      ),
    );
  }
}
