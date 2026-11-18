import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class TimestampCard extends StatelessWidget {
  final String label;
  final DateTime timestamp;
  const TimestampCard({
    super.key,
    required this.label,
    required this.timestamp,
  });

  Icon setIcon() {
    Icon displayIcon;
    switch (label) {
      case 'Clock In':
        displayIcon = FaIcon(FontAwesomeIcons.play);
      case 'Lunch Start':
        displayIcon = FaIcon(FontAwesomeIcons.circlePause);
      case 'Lunch End':
        displayIcon = FaIcon(FontAwesomeIcons.circlePlay);
      case 'Clock Out':
        displayIcon = FaIcon(FontAwesomeIcons.stop);
      default:
        displayIcon = FaIcon(FontAwesomeIcons.question);
    }
    return displayIcon;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            setIcon(),
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
