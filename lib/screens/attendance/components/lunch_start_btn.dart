import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LunchStartBtn extends ConsumerWidget {
  const LunchStartBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 300),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
            padding: EdgeInsets.all(21),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.keyboard_double_arrow_left_outlined),
              SizedBox(width: 8),
              Text('START LUNCH', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
