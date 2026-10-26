import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:virtual_keypad/widgets.dart';

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

class Keypad extends ConsumerStatefulWidget {
  const Keypad({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _KeypadState();
}

class _KeypadState extends ConsumerState<Keypad> {
  // final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return VirtualKeypad(
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
        if (action == KeyAction.done && text.isNotEmpty) {
          print('heee');
          ref.watch(employeeProvider.notifier).checkEmployee(text);

          // controller.clear();
        }
      },
    );
  }
}
