import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/providers/workorder_provider.dart';

class EmptyTimecard extends ConsumerWidget {
  const EmptyTimecard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Card(
            elevation: 4,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.timer_off_outlined, size: 48),
                  Text(
                    'EMPTY TIME CARD',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight(400)),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: Row(
            children: [
              Text('Items To Be Entered', style: TextStyle(fontSize: 19)),
            ],
          ),
        ),
        ...ref
            .watch(workorderProvider)
            .map(
              (item) => Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('WO#: $item')],
                  ),
                ),
              ),
            ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              flex: 1,
              child: ElevatedButton(onPressed: () {}, child: Text('POST')),
            ),
          ],
        ),
      ],
    );
  }
}
