import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final String title;
  final String value;

  const ItemWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: 24,
        ),
        Text(value,
            style: TextStyle(
              fontSize: 14,
            )),
      ],
    );
  }
}
