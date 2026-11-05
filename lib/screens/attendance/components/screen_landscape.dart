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
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(employeeProvider, (previous, next) {
      if (next!.uuid != null) {
        idController.clear();
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
        // idController.clear();
        ScaffoldMessenger.of(context)
            .showSnackBar(
              SnackBar(
                content: Text('No Valid Employee'),
                backgroundColor: Colors.redAccent,
              ),
            )
            .closed
            .then((value) => {idController.clear(), focusNode.requestFocus()});
      }
    }

    return Row(
      children: [
        Expanded(flex: 2, child: Container(color: Colors.white)),
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('ENTER EMPLOYEE ID NUMBER', style: TextStyle(fontSize: 21)),
              TextField(
                focusNode: focusNode,
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
        Expanded(flex: 2, child: Container(color: Colors.white)),
      ],
    );
  }
}
