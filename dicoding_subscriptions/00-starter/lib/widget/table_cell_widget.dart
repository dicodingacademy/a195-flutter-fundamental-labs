import 'package:flutter/material.dart';

class TableCellWidget extends StatelessWidget {
  final String? text;
  final bool isBold;
  final bool check;

  const TableCellWidget({
    Key? key,
    this.text,
    this.isBold = false,
    this.check = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      child: text != null
          ? Text(
              text.toString(),
              style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              ),
            )
          : Icon(check ? Icons.done : Icons.close),
    );
  }
}
