import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClockInBtn extends ConsumerWidget {
  const ClockInBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 300),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(padding: EdgeInsets.all(21)),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.start),
              SizedBox(width: 8),
              Text('CLOCK IN', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
