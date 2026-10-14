import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/models/timecard.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SummaryStep extends ConsumerStatefulWidget {
  const SummaryStep({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SummaryStepState();
}

class _SummaryStepState extends ConsumerState<SummaryStep> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            'Current Timecard',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight(400)),
          ),

          // Text(ref.watch(workorderProvider).toString()),
          Expanded(
            child: Text('here'),
            // child: ListView(
            //   children: ref
            //       .watch(workorderProvider)
            //       .map(
            //         (item) => Card(
            //           color: Colors.white,
            //           child: Padding(
            //             padding: const EdgeInsets.all(12.0),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               children: [
            //                 Text(
            //                   'Employee: ${ref.watch(employeeProvider)}',
            //                   style: TextStyle(color: Colors.blue.shade900),
            //                 ),
            //                 Text(
            //                   'WO: $item',
            //                   style: TextStyle(color: Colors.blue.shade900),
            //                 ),
            //                 Text(
            //                   'Rout: 40',
            //                   style: TextStyle(color: Colors.blue.shade900),
            //                 ),
            //                 IconButton(
            //                   onPressed: () {},
            //                   icon: Icon(
            //                     Icons.delete_outline_outlined,
            //                     color: Colors.red,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       )
            //       .toList(),
            // ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            spacing: 24,
            children: [
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                onPressed: () {},
                child: Text('CANCEL'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  backgroundColor: Colors.blue.shade600,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(9),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Text('CLOCK IN'),
                    SizedBox(width: 12),
                    Icon(Icons.keyboard_double_arrow_right_outlined, size: 24),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
