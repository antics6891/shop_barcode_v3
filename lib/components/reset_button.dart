import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResetButton extends ConsumerStatefulWidget {
  const ResetButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ResetButtonState();
}

class _ResetButtonState extends ConsumerState<ResetButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red.shade500,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(9),
        ),
      ),
      child: Row(
        children: [Icon(Icons.refresh), SizedBox(width: 8), Text('RESET')],
      ),
    );
  }
}
