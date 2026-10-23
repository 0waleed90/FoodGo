import 'package:delivery/core/utils/app_router.dart';
import 'package:delivery/core/utils/styles.dart';
import 'package:delivery/feature/home/presentation/manger/search_cubit/search_cubit.dart';
import 'package:delivery/feature/home/presentation/views/widgets/category_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/constants.dart';
import 'category_filter_bar.dart';
import 'foods_grid_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final FocusNode _searchFocusNode = FocusNode();
  bool _isSearching = false;

  @override
  void initState() {
    _searchFocusNode.addListener(() {
      setState(() {
        _isSearching = _searchFocusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Foodgo',
                  style: TextStyle(fontSize: 60, fontFamily: 'Lobster'),
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kAccountView);
                  },
                  child: Image.asset('assets/photos/burger.png', height: 60),
                ),
              ],
            ),
            Text('Order your favourite food!', style: Styles.textStyle20),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          spreadRadius: 0,
                          blurStyle: BlurStyle.outer,
                          color: Colors.black26,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: TextField(
                      onChanged: (query) {
                        context.read<SearchCubit>().productSearch(query);
                      },
                      focusNode: _searchFocusNode,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: const TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) => const CategoryBottomSheet(),
                    );
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(blurStyle: .outer,blurRadius: 10,color: Colors.black26)],
                      borderRadius: BorderRadius.circular(20),
                      color: kPrimaryColor,
                    ),
                    child: const Icon(
                      Icons.settings_input_composite_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _isSearching
                ? SearchResult(isSearching: _isSearching)
                : NormalContent(isSearching: _isSearching),
          ],
        ),
      ),
    );
  }
}

class SearchResult extends StatelessWidget {
  const SearchResult({super.key, required this.isSearching});
  final bool isSearching;

  @override
  Widget build(BuildContext context) {
    return FoodsGridView(isSearching: isSearching);
  }
}

class NormalContent extends StatelessWidget {
  const NormalContent({super.key, required this.isSearching});
  final bool isSearching;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CategoryFilterBar(),
          const SizedBox(height: 10),
          FoodsGridView(isSearching: isSearching),
        ],
      ),
    );
  }
}
