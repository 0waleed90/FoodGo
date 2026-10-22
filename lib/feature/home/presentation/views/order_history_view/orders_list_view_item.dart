import 'package:delivery/core/utils/styles.dart';
import 'package:flutter/material.dart';

class OrdersListViewItem extends StatelessWidget {
  const OrdersListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.all(7),
        height: 100,
        decoration: BoxDecoration(
          border: .all(color: Colors.black),
          borderRadius: .circular(16),
        ),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Image.asset('assets/photos/burger.png',width: 100,fit: .contain,),
SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                mainAxisAlignment: .spaceEvenly,
                children: [
                  Text('Regular Fit Slogan',style: Styles.textStyle20,maxLines: 1,overflow: .ellipsis,),
                  Text('count : 2',style: Styles.textStyle16,maxLines: 1,overflow: .ellipsis),
                  Text(r'price : 12.12 $',style: Styles.textStyle16,maxLines: 1,overflow: .ellipsis,),
                ],
              ),
            ),
            Container(
              height: 30,
             padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Color(0xffE4F2E4))],
                borderRadius: .circular(12),
              ),
              child: Center(
                child: Text(
                  'completed',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 14,
                    fontWeight: .w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
