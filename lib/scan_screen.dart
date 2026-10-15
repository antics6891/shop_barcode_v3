// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/components/empty_timecard.dart';
import 'package:shop_barcode_scan_v3/components/id_step.dart';
import 'package:shop_barcode_scan_v3/components/reset_button.dart';
import 'package:shop_barcode_scan_v3/components/summary_step.dart';
import 'package:shop_barcode_scan_v3/components/wo_step.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:shop_barcode_scan_v3/providers/stage_provider.dart';
import 'package:shop_barcode_scan_v3/providers/timecard_provider.dart';
import 'package:shop_barcode_scan_v3/providers/workorder_provider.dart';
import 'package:shop_barcode_scan_v3/success_screen.dart';

class ScanScreen extends ConsumerStatefulWidget {
  const ScanScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScanScreenState();
}

class _ScanScreenState extends ConsumerState<ScanScreen> {
  List<String> workOrders = [];
  bool isComplete = false;
  late final FocusNode woFocusNode;

  @override
  void dispose() {
    woFocusNode.dispose();
    super.dispose();
  }

  Widget handleScreen() {
    Widget what;
    switch (ref.watch(stageProvider)) {
      case 0:
        what = IdStep();
        break;
      case >= 1:
        what = WoStep();
      case 2:
        what = SummaryStep();
      default:
        what = Text('Default');
        break;
    }
    return what;
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    woFocusNode = FocusNode();
    // helper.initWinDB();
  }

  @override
  Widget build(BuildContext context) {
    // print(helper.getAllUsers());
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 16),
        actions: [Text(ref.watch(employeeProvider).toString())],
        title: Text('Scan Station'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isComplete
              ? SuccessScreen()
              : ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: Column(
                    spacing: 32,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // EasyStepper(
                      //   showStepBorder: false,
                      //   activeStep: ref.watch(stageProvider),
                      //   steps: [
                      //     EasyStep(icon: Icon(Icons.badge), title: '1'),
                      //     EasyStep(
                      //       title: '2',
                      //       icon: Icon(Icons.document_scanner_outlined),
                      //     ),
                      //     EasyStep(
                      //       title: 'Summary',
                      //       icon: Icon(Icons.summarize_outlined),
                      //     ),
                      //   ],
                      // ),
                      // Expanded(child: handleScreen()),
                      Expanded(
                        child: Column(
                          children: [
                            ref.watch(employeeProvider).isEmpty
                                ? IdStep()
                                : Text(
                                    'Employee: ${ref.read(employeeProvider)}',
                                  ),
                            ref.watch(workorderProvider).isEmpty
                                ? WoStep()
                                : Text(
                                    '${ref.read(employeeProvider).length.toString()} Pending Orders',
                                  ),
                            ref.watch(timecardProvider).isEmpty
                                ? EmptyTimecard()
                                : Text('stuff'),
                          ],
                        ),
                      ),
                      // handleScreen(),
                    ],
                  ),
                  // child: Center(
                  //   child: Column(
                  //     children: [
                  //       EasyStepper(
                  //         showStepBorder: false,
                  //         activeStep: ref.watch(stageProvider),
                  //         steps: [
                  //           EasyStep(icon: Icon(Icons.badge), title: '1'),
                  //           EasyStep(
                  //             title: '2',
                  //             icon: Icon(Icons.document_scanner_outlined),
                  //           ),
                  //           EasyStep(
                  //             title: 'Summary',
                  //             icon: Icon(Icons.summarize_outlined),
                  //           ),
                  //         ],
                  //       ),
                  //       handleScreen(),
                  //     ],
                  //   ),
                  // ),
                ),
        ),
      ),
    );
  }
}
