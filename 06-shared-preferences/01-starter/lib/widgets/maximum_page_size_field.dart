import 'package:flutter/material.dart';
import 'package:shared_preferences_app/widgets/title_form.dart';

class MaximumPageSizeField extends StatelessWidget {
  final TextEditingController controller;
  final List<int> maximumPageSizeNumbers;

  const MaximumPageSizeField({
    super.key,
    required this.controller,
    required this.maximumPageSizeNumbers,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleForm(
            'Maximum page size:',
          ),
          const SizedBox.square(dimension: 4),
          DropdownMenu(
            controller: controller,
            initialSelection: maximumPageSizeNumbers.first,
            dropdownMenuEntries: maximumPageSizeNumbers
                .map(
                  (pageSizeNumber) => DropdownMenuEntry(
                    value: pageSizeNumber,
                    label: pageSizeNumber.toString(),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
