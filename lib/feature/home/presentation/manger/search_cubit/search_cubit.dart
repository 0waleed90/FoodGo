import 'package:delivery/feature/home/data/repo/food_repo.dart';
import 'package:delivery/feature/home/presentation/manger/search_cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final FoodRepo foodRepo;

  SearchCubit({required this.foodRepo}) : super(SearchInitial());

  Future<void> productSearch(String query) async {
    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());

    String normalize(String text) {
      return text
          .replaceAll(RegExp(r'[\u064B-\u0652]'), '')
          .replaceAll('أ', 'ا')
          .replaceAll('إ', 'ا')
          .replaceAll('آ', 'ا')
          .replaceAll('ة', 'ه')
          .replaceAll("ي", "ى");
    }

    final normalizedQuery = normalize(query);

    final result = await foodRepo.foodSearch(normalizedQuery);
    result.fold(
      (failure) {
        emit(SearchFailure(errorMessage: failure.errorMessage));
      },
      (searchResult) {
        emit(SearchSuccess( foods: searchResult));
      },
    );
  }
}
