import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/providers/stage_provider.dart';
import 'package:shop_barcode_scan_v3/providers/workorder_provider.dart';

class WoStep extends ConsumerStatefulWidget {
  const WoStep({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WoStepState();
}

class _WoStepState extends ConsumerState<WoStep> {
  final woTextController = TextEditingController();
  final woFocusNode = FocusNode();

  // List<String> woList = [];

  void handleAddToList(String wo) {
    ref.read(workorderProvider.notifier).addToWos(wo);
    // setState(() {
    //   woList = [...woList, wo];
    // });
    woTextController.clear();
    woFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Scan Work Order',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        TextField(
          focusNode: woFocusNode,
          autofocus: true,
          decoration: InputDecoration(border: OutlineInputBorder()),
          controller: woTextController,
          onSubmitted: (value) {
            handleAddToList(value);
          },
        ),
        for (var i in ref.watch(workorderProvider))
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('WO#: $i'),
                  IconButton(
                    onPressed: () {
                      ref.watch(workorderProvider.notifier).removeWo(i);
                    },
                    icon: Icon(Icons.delete_outline_rounded, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(9),
                  ),
                ),
                onPressed: () {
                  if (woTextController.text.isNotEmpty) {
                    ref
                        .read(workorderProvider.notifier)
                        .addToWos(woTextController.text);
                    ref.read(stageProvider.notifier).incrementStage();
                  } else {
                    ref.read(stageProvider.notifier).incrementStage();
                  }
                },
                child: Row(
                  children: [
                    Text('NEXT'),
                    SizedBox(width: 8),
                    Icon(Icons.chevron_right_sharp, size: 22),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
