// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:shop_barcode_scan_v3/success_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  List<String> workOrders = [];
  final idController = TextEditingController();
  final woController = TextEditingController();
  int _index = 0;
  bool isComplete = false;
  late final FocusNode woFocusNode;

  @override
  void dispose() {
    idController.dispose();
    woFocusNode.dispose();
    super.dispose();
  }

  void handleSubmit() => {
    setState(() {
      _index++;
    }),
  };

  void handleWoSubmit() => {
    setState(() {
      workOrders.add(woController.text);
      woController.clear();
      woFocusNode.requestFocus();
    }),
  };

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
      appBar: AppBar(
        title: Text('Scan Station'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isComplete
            ? SuccessScreen()
            : Column(
                children: [
                  Text(_index.toString()),
                  Expanded(
                    child: Stepper(
                      controlsBuilder: (context, details) {
                        return Container(
                          margin: EdgeInsets.only(top: 32),
                          child: Row(
                            children: [
                              if (_index != 0)
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue.shade600,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(8),
                                      ),
                                    ),
                                    onPressed: details.onStepCancel,
                                    child: Text('BACK'),
                                  ),
                                ),
                              SizedBox(width: 12),
                              if (_index == 1)
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green.shade600,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(8),
                                      ),
                                    ),
                                    onPressed: details.onStepContinue,
                                    child: Text('NEXT'),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                      elevation: 4,
                      type: StepperType.horizontal,
                      currentStep: _index,
                      onStepCancel: () {
                        print('heeeekke');
                        if (_index > 0) {
                          setState(() {
                            _index -= 1;
                          });
                        }
                      },
                      onStepContinue: () {
                        print(_index);
                        if (_index <= 2) {
                          setState(() {
                            _index += 1;
                          });
                        }
                        // if (_index <= 0) {
                        //   setState(() {
                        //     _index += 1;
                        //   });
                        // }
                      },
                      steps: [
                        Step(
                          state: _index > 0
                              ? StepState.complete
                              : StepState.indexed,
                          isActive: _index >= 0,
                          title: Text('ID'),
                          content: SizedBox(
                            // height: MediaQuery.sizeOf(context).height * 0.75,
                            child: Column(
                              mainAxisAlignment: .center,
                              crossAxisAlignment: .center,
                              children: [
                                Row(
                                  crossAxisAlignment: .center,
                                  mainAxisAlignment: .center,
                                  children: [
                                    Text(
                                      'ENTER ID NUMBER TO BEGIN',
                                      textAlign: .center,
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),

                                Row(
                                  crossAxisAlignment: .center,
                                  mainAxisAlignment: .center,
                                  children: [
                                    SizedBox(
                                      width: 300,
                                      child: TextField(
                                        style: TextStyle(fontSize: 30),
                                        textAlign: TextAlign.center,
                                        autofocus: true,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              9,
                                            ),
                                          ),
                                        ),
                                        controller: idController,
                                        onSubmitted: (value) => handleSubmit(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Step(
                          state: _index > 1
                              ? StepState.complete
                              : StepState.indexed,
                          isActive: _index >= 1,
                          title: Text('Step 2'),
                          content: Column(
                            mainAxisAlignment: .center,
                            crossAxisAlignment: .center,
                            children: [
                              Row(
                                crossAxisAlignment: .center,
                                mainAxisAlignment: .center,
                                children: [
                                  Text(
                                    'SCAN WORK ORDER',
                                    textAlign: .center,
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),

                              Row(
                                crossAxisAlignment: .center,
                                mainAxisAlignment: .center,
                                children: [
                                  SizedBox(
                                    width: 300,
                                    child: TextField(
                                      focusNode: woFocusNode,
                                      style: TextStyle(fontSize: 30),
                                      textAlign: TextAlign.center,
                                      autofocus: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            9,
                                          ),
                                        ),
                                      ),
                                      controller: woController,
                                      onSubmitted: (value) => handleWoSubmit(),
                                    ),
                                  ),
                                ],
                              ),
                              workOrders.isNotEmpty
                                  ? Column(
                                      children: [
                                        Text('Scanned Orders'),
                                        ...workOrders.map((wo) => Text(wo)),
                                      ],
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                        Step(
                          state: _index == 2
                              ? StepState.complete
                              : StepState.indexed,
                          title: Text('Step 3'),
                          content: Column(
                            spacing: 12,
                            mainAxisAlignment: .center,
                            crossAxisAlignment: .center,
                            children: [
                              Row(
                                crossAxisAlignment: .center,
                                mainAxisAlignment: .center,
                                children: [
                                  Text(
                                    'SUMMARY',
                                    textAlign: .start,
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),

                              Row(
                                crossAxisAlignment: .center,
                                mainAxisAlignment: .start,
                                children: [
                                  Text(
                                    'ID#: ${idController.text}',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight(500),
                                    ),
                                  ),
                                  SizedBox(width: 22),
                                  Text(
                                    '(First Last)',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: .center,
                                mainAxisAlignment: .start,
                                children: [
                                  Text(
                                    'WO: ${woController.text}',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight(500),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: .center,
                                mainAxisAlignment: .start,
                                children: [
                                  Text(
                                    'Routing: ##',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight(500),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green.shade700,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(8),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text('SUBMIT'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
