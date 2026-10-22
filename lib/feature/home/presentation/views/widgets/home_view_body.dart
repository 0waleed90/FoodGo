import 'package:delivery/core/utils/app_router.dart';
import 'package:delivery/core/utils/styles.dart';
import 'package:delivery/feature/home/presentation/views/widgets/category_bottom_sheet.dart';
import 'package:flutter/material.dart';
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
          crossAxisAlignment: .start,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  'Foodgo',
                  style: TextStyle(fontSize: 60, fontFamily: 'Lobster'),
                ),
                GestureDetector(

                    onTap: (){GoRouter.of(context).push(AppRouter.kAccountView);},
                    child: Image.asset('assets/photos/burger.png', height: 60)),
              ],
            ),
            Text('Order your favourite food!', style: Styles.textStyle20),

            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,

                    decoration: BoxDecoration(
                      borderRadius: .circular(20),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 0,

                          blurStyle: .outer,
                          color: Colors.black26,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: TextField(
                      focusNode: _searchFocusNode,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(fontSize: 21, fontWeight: .w400),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: .none,
                          borderRadius: .circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled:
                          true, // للسماح لها بأخذ مساحة أكبر إذا لزم الأمر
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
                      borderRadius: .circular(20),
                      color: kPrimaryColor,
                    ),
                    child: Icon(
                      Icons.settings_input_composite_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            _isSearching ? SizedBox() : CategoryFilterBar(),

            FoodsGridView(),
          ],
        ),
      ),
    );
  }
}
