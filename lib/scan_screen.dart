// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:shop_barcode_scan_v3/providers/routing_provider.dart';
import 'package:shop_barcode_scan_v3/providers/workorder_provider.dart';
import 'package:shop_barcode_scan_v3/success_screen.dart';

const routings = [
  {"routing": 10, "title": "plasma"},
  {"routing": 15, "title": "Tube Laser"},
  {"routing": 20, "title": "Fabrication"},
  {"routing": 25, "title": "CNC Mill"},
  {"routing": 30, "title": "Machining"},
  {"routing": 35, "title": "CNC Maching"},
  {"routing": 40, "title": "Welding"},
  {"routing": 50, "title": "Clean/Paint"},
  {"routing": 60, "title": "Assembly"},
  {"routing": 70, "title": "Ship/Rec"},
  {"routing": 80, "title": "Clean"},
  {"routing": 90, "title": "Supervisor"},
];

class ScanScreen extends ConsumerStatefulWidget {
  const ScanScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScanScreenState();
}

class _ScanScreenState extends ConsumerState<ScanScreen> {
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

  void handleSubmit(WidgetRef ref) => {
    ref.read(employeeProvider.notifier).setEmp(idController.text),
    setState(() {
      _index++;
    }),
  };

  void handleWoSubmit() => {
    ref.read(workorderProvider.notifier).addToWos(woController.text),
    setState(() {
      woController.clear();
      woFocusNode.requestFocus();
    }),
  };

  void handleRouteChange(String val) => {
    ref.read(routingProvider.notifier).setNewRoute(val),
    Navigator.pop(context),
  };

  void handleFormSubmit() => {};

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    woFocusNode = FocusNode();
    // helper.initWinDB();
  }

  @override
  Widget build(BuildContext context) {
    final employee = ref.watch(employeeProvider);
    final wos = ref.watch(workorderProvider);
    final rout = ref.watch(routingProvider);
    // print(helper.getAllUsers());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                    children: [
                      Expanded(
                        child: Theme(
                          data: ThemeData(canvasColor: Colors.white),
                          child: Stepper(
                            controlsBuilder: (context, details) => SizedBox(),
                            elevation: 0,
                            type: StepperType.horizontal,
                            currentStep: _index,
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
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                ),
                                              ),
                                              controller: idController,
                                              onSubmitted: (value) =>
                                                  handleSubmit(ref),
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
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                              ),
                                            ),
                                            controller: woController,
                                            onSubmitted: (value) =>
                                                handleWoSubmit(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    wos.isNotEmpty
                                        ? Column(
                                            children: [
                                              Text('Scanned Orders'),
                                              ...wos.map(
                                                (wo) => Card(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                          12.0,
                                                        ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'WO#: $wo',
                                                          style: TextStyle(
                                                            fontSize: 19,
                                                          ),
                                                        ),
                                                        IconButton(
                                                          onPressed: () {
                                                            ref
                                                                .read(
                                                                  workorderProvider
                                                                      .notifier,
                                                                )
                                                                .removeWo(wo);
                                                          },
                                                          icon: Icon(
                                                            Icons
                                                                .delete_outline,
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
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
                                          'ID#:',
                                          style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight(500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(width: 24),
                                        Text(
                                          employee,
                                          style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight(400),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: .center,
                                      mainAxisAlignment: .start,
                                      children: [
                                        Text(
                                          wos.length > 1 ? "WO's" : "WO",
                                          style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight(500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    for (var item in wos)
                                      Row(
                                        children: [
                                          SizedBox(width: 24),
                                          Text(
                                            item,
                                            style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight(400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    Row(
                                      crossAxisAlignment: .center,
                                      mainAxisAlignment: .start,
                                      children: [
                                        Text(
                                          'Routing:',
                                          style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight(500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,

                                      children: [
                                        SizedBox(width: 24),
                                        Text(
                                          rout,
                                          style: TextStyle(fontSize: 19),
                                        ),

                                        TextButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  actions: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('CANCEL'),
                                                    ),
                                                  ],
                                                  backgroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadiusGeometry.circular(
                                                          9,
                                                        ),
                                                  ),
                                                  title: Text(
                                                    'Select New Routing',
                                                  ),
                                                  content: Builder(
                                                    builder: (context) {
                                                      final width =
                                                          MediaQuery.of(
                                                            context,
                                                          ).size.width;
                                                      return SizedBox(
                                                        width: width - 250,
                                                        child: Column(
                                                          spacing: 8,
                                                          children: [
                                                            for (
                                                              int i = 0;
                                                              i <
                                                                  routings
                                                                      .length;
                                                              i++
                                                            )
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 300,
                                                                    child: ElevatedButton(
                                                                      style: ElevatedButton.styleFrom(
                                                                        backgroundColor: Colors
                                                                            .grey
                                                                            .shade100,
                                                                        textStyle: TextStyle(
                                                                          fontSize:
                                                                              17,
                                                                          fontWeight: FontWeight(
                                                                            400,
                                                                          ),
                                                                        ),
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                              18,
                                                                            ),
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadiusGeometry.circular(
                                                                                9,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      onPressed: () {
                                                                        handleRouteChange(
                                                                          routings[i]['routing']
                                                                              .toString(),
                                                                        );
                                                                      },
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'Routing ${routings[i]['routing'].toString()}',
                                                                            style: TextStyle(
                                                                              color: Colors.black87,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            ' ${routings[i]['title']}',
                                                                            style: TextStyle(
                                                                              color: Colors.black87,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.edit_outlined,
                                                color: Colors.blueAccent,
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                'EDIT',
                                                style: TextStyle(
                                                  fontWeight: FontWeight(400),
                                                  fontSize: 16,
                                                  color: Colors.blueAccent,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Colors.green.shade700,
                                            foregroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadiusGeometry.circular(
                                                    8,
                                                  ),
                                            ),
                                          ),
                                          onPressed: () {
                                            Future.delayed(
                                              Duration(seconds: 2),
                                              () {
                                                setState(() {
                                                  isComplete = true;
                                                });
                                              },
                                            );
                                          },
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
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
