import 'package:delivery/core/utils/constants.dart';
import 'package:delivery/core/utils/styles.dart';
import 'package:delivery/feature/home/presentation/manger/category_cubit/category_cubit.dart';
import 'package:delivery/feature/home/presentation/manger/category_cubit/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryFilterBar extends StatefulWidget {
  const CategoryFilterBar({super.key});

  @override
  State<CategoryFilterBar> createState() => _CategoryFilterBarState();
}

class _CategoryFilterBarState extends State<CategoryFilterBar> {
  List<String> category = ['all', 'dddd', 'dddddd'];
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit,CategoryState>(
      builder: (context, state) {
        if (state is CategorySuccess) {
          return SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            blurStyle: .outer,
                          ),
                        ],
                        borderRadius: .circular(20),
                        color: selectedCategory == index
                            ? kPrimaryColor
                            : Color(0xffF0F1F3),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            state.categories[index],
                            style: Styles.textStyle16,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }else if(state is CategoryFailure){return Text( state.errorMessage);}


        else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
