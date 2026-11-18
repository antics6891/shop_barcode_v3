import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_barcode_scan_v3/api/employee_service.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:toastification/toastification.dart';
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

class IdInput extends ConsumerStatefulWidget {
  const IdInput({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IdInputState();
}

class _IdInputState extends ConsumerState<IdInput> {
  final controller = TextEditingController();
  final idController = VirtualKeypadController();
  bool isLoading = false;
  late FocusNode focusNode;

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
      if (context.mounted) {
        toastification.show(
          title: Text('Check ID Number'),
          autoCloseDuration: const Duration(seconds: 2),
          type: ToastificationType.error,
          style: ToastificationStyle.fillColored,
          alignment: Alignment.bottomCenter,
          icon: FaIcon(FontAwesomeIcons.exclamation),
          callbacks: ToastificationCallbacks(
            onAutoCompleteCompleted: (value) {
              // ref.watch(employeeProvider.notifier).clearEmployee();
              idController.clear();
              focusNode.requestFocus();
            },
          ),
        );
      }
    }
  }

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
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 400),
        child: Column(
          spacing: 24,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text('ENTER EMPLOYEE ID NUMBER', style: TextStyle(fontSize: 21)),
            TextField(
              focusNode: focusNode,
              textAlign: TextAlign.center,
              autofocus: true,

              decoration: InputDecoration(
                label: Text('ID Number'),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(9),
                // ),
              ),
              style: TextStyle(fontSize: 40, letterSpacing: 0.2),
              controller: idController,
            ),
            VirtualKeypad(
              theme: VirtualKeypadTheme(
                backgroundColor: Colors.white,
                keyColor: Colors.white70,
                keyTextSize: 30,
                keyTextColor: Colors.black87,
                // keyShadow: true,
                verticalGap: 10,
                horizontalGap: 10,
                actionKeyColor: Colors.blue.shade600,
                keyBorderRadius: 8,
              ),

              customLayout: pinLayout,
              type: KeyboardType.custom,
              standalone: true,
              onStandaloneInputAction: (action, text) async {
                if (action == KeyAction.done && idController.text.isNotEmpty) {
                  handleIdCheck();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
