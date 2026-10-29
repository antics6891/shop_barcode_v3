import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/models/employee.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:shop_barcode_scan_v3/providers/test.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/keypad.dart';

class ScreenPortrait extends ConsumerStatefulWidget {
  const ScreenPortrait({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScreenPortraitState();
}

class _ScreenPortraitState extends ConsumerState<ScreenPortrait> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: double.infinity,
          child: Card(
            color: Colors.white,
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ATTENDANCE KIOSK', style: TextStyle(fontSize: 27)),
                  Text(
                    'No Notifications',
                    style: TextStyle(fontSize: 19, color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(label: Text("ID Number")),
            controller: controller,
            autofocus: true,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
        ),
        Keypad(),
      ],
    );
  }
}
