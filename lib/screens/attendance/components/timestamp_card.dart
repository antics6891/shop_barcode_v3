import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimestampCard extends StatelessWidget {
  final String label;
  final DateTime timestamp;
  const TimestampCard({
    super.key,
    required this.label,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade100,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
            ),

            Text(
              DateFormat('h:mm a').format(timestamp),
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
