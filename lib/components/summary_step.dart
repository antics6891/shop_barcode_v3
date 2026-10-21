import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/components/empty_timecard.dart';
import 'package:shop_barcode_scan_v3/providers/timecard_provider.dart';

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
      child: ref.watch(timecardProvider)!.id.isNaN
          ? EmptyTimecard()
          : Text('data'),
      // child: Column(
      //   children: [
      //     ref.watch(timecardProvider).isEmpty
      //         ? EmptyTimecard()
      //         : Text('Not Empty'),
      //     Text('Items to be added'),
      //     Icon(Icons.arrow_downward_outlined),
      //   ],
      // ),
    );
  }
}
