import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/api/employee_service.dart';
import 'package:shop_barcode_scan_v3/models/employee.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:shop_barcode_scan_v3/providers/error_provider.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/emp_confirm.dart';
import 'package:virtual_keypad/virtual_keypad.dart';

final pinLayout = [
  [
    VirtualKey.character(text: '1'),
    VirtualKey.character(text: '2'),
    VirtualKey.character(text: '3'),
  ],
  [
    VirtualKey.character(text: '4'),
    VirtualKey.character(text: '5'),
    VirtualKey.character(text: '6'),
  ],
  [
    VirtualKey.character(text: '7'),
    VirtualKey.character(text: '8'),
    VirtualKey.character(text: '9'),
  ],
  [
    VirtualKey.action(action: KeyAction.backSpace),
    VirtualKey.character(text: '0'),
    VirtualKey.action(action: KeyAction.done, label: '✓'),
  ],
];

class ScreenLandscape extends ConsumerStatefulWidget {
  const ScreenLandscape({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ScreenLandscapeState();
}

class _ScreenLandscapeState extends ConsumerState<ScreenLandscape> {
  final idController = VirtualKeypadController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ref.listen(employeeProvider, (previous, next) {
      if (next!.uuid != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EmpConfirm()),
        );
      }
    });
    void handleIdCheck() async {
      setState(() {
        isLoading = true;
      });
      final res = await EmployeeService().checkEmployee(idController.text);

      if (res != null) {
        setState(() {
          isLoading = false;
        });
        ref.read(employeeProvider.notifier).setEmployee(res);
      } else {
        setState(() {
          isLoading = false;
        });
        idController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No Valid Employee'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }

    return Row(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Card(
              color: Colors.white,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(19.0),
                child: Column(
                  spacing: 32,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ATTENDANCE KIOSK', style: TextStyle(fontSize: 27)),
                    Text(
                      'No Notifications',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ENTER EMPLOYEE ID NUMBER',
                  style: TextStyle(fontSize: 25),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    textAlign: TextAlign.center,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    style: TextStyle(fontSize: 32, letterSpacing: 0.2),
                    controller: idController,
                  ),
                ),
                VirtualKeypad(
                  theme: VirtualKeypadTheme(
                    backgroundColor: Colors.white,
                    keyColor: Colors.grey.shade500,
                    keyTextSize: 30,
                    keyTextColor: Colors.white,
                    keyShadow: true,
                    verticalGap: 10,
                    horizontalGap: 10,
                    actionKeyColor: Colors.blue.shade600,
                    keyBorderRadius: 10,
                  ),

                  customLayout: pinLayout,
                  type: KeyboardType.custom,
                  standalone: true,
                  onStandaloneInputAction: (action, text) async {
                    if (action == KeyAction.done &&
                        idController.text.isNotEmpty) {
                      handleIdCheck();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
