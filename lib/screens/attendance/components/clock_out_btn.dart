import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClockOutBtn extends ConsumerWidget {
  const ClockOutBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 300),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(21),
            backgroundColor: Colors.green.shade600,
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back_sharp),
              SizedBox(width: 8),
              Text('CLOCK OUT', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
