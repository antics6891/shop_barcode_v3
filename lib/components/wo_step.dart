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
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 400),
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
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
          ref.watch(workorderProvider).isNotEmpty
              ? Text('Pending Scans')
              : Container(),
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
                      icon: Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
