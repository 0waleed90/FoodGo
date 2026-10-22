import 'package:delivery/core/utils/styles.dart';
import 'package:flutter/material.dart';

class PaymentMethodListViewItem extends StatefulWidget {
  const PaymentMethodListViewItem({
    super.key,

    required this.selectedCard,
    required this.index,
    required this.onTap,
  });

  final bool selectedCard;
  final int index;
  final VoidCallback onTap;

  @override
  State<PaymentMethodListViewItem> createState() =>
      _PaymentMethodListViewItemState();
}

class _PaymentMethodListViewItemState extends State<PaymentMethodListViewItem> {
  bool isEditing = false;
  String cardNumberOfCard0 = '5105 **** **** 0505';
  String cardNumberOfCard1 = '3566 **** **** 0505';
  late TextEditingController _cardNumberController;
  @override
  void initState() {
    _cardNumberController = TextEditingController(
      text: widget.index == 0 ? '5105 **** **** 0505' : '3566 **** **** 0505',
    );
    super.initState();
  }

  @override
  void dispose() {
    _cardNumberController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 10, blurStyle: .outer),
          ],
          color: widget.index == 0 ? Color(0xff3B2E2E) : Colors.white,
          borderRadius: .circular(20),
        ),

        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: widget.index == 0
                  ? Image.asset('assets/photos/master_card.png')
                  : Image.asset('assets/photos/visa.png'),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.index == 0 ? 'Credit card' : 'Debit card',
                    style: Styles.textStyle14.copyWith(
                      color: widget.index == 0 ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  isEditing
                      ? SizedBox(
                          height: 32,
                          child: TextField(
                            controller: _cardNumberController,
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            style: Styles.textStyle14.copyWith(
                              color: widget.index == 0
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 6,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: widget.index == 0
                                      ? Colors.white54
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Text(
                          _cardNumberController.text,
                          style: Styles.textStyle14.copyWith(
                            color: const Color(0xff808080),
                          ),
                        ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: widget.onTap,
                  icon: Icon(
                    widget.selectedCard
                        ? Icons.radio_button_checked
                        : Icons.circle_outlined,
                    color: widget.index == 0 ? Colors.white : Colors.black,
                    size: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
                  icon: Icon(
                    isEditing ? Icons.check : Icons.edit,
                    color: isEditing
                        ? Colors.green
                        : (widget.index == 0 ? Colors.white : Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
