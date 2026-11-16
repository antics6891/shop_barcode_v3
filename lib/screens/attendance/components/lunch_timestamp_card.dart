import 'package:flutter/material.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/models/timecard.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:intl/intl.dart';

class LunchTimestampCard extends ConsumerWidget {
  TimecardModel? userTimecard;
  LunchTimestampCard({super.key, this.userTimecard});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tester = {
      'Start': userTimecard!.clock_in,
      'Lunch': userTimecard!.lunch_start,
      'End': userTimecard!.clock_out,
    };

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FixedTimeline.tileBuilder(
            builder: TimelineTileBuilder.connectedFromStyle(
              contentsAlign: ContentsAlign.basic,
              oppositeContentsBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(tester.keys.elementAt(index)),
              ),
              contentsBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Contents'),
                  ),
                ),
              ),
              connectorStyleBuilder: (context, index) =>
                  ConnectorStyle.solidLine,
              indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
              itemCount: 3,
            ),
          ),
          // TimelineTile(
          //   oppositeContents: Padding(
          //     padding: const EdgeInsets.all(12.0),
          //     child: Card(
          //       child: Padding(
          //         padding: EdgeInsetsGeometry.all(16),
          //         child: Row(children: [Text('IN: ')]),
          //       ),
          //     ),
          //   ),
          //   contents: Padding(
          //     padding: const EdgeInsets.all(12.0),
          //     child: Card(
          //       child: Padding(
          //         padding: EdgeInsetsGeometry.all(16),
          //         child: Row(
          //           children: [
          //             Text(
          //               tester.values.elementAt(0) == null
          //                   ? '--'
          //                   : DateFormat(
          //                       'h:mm a',
          //                     ).format(tester.values.elementAt(0)!),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          //   node: TimelineNode(
          //     indicator: DotIndicator(),
          //     endConnector: SolidLineConnector(),
          //     startConnector: DashedLineConnector(),
          //   ),
          // ),
          // TimelineTile(
          //   oppositeContents: Padding(
          //     padding: const EdgeInsets.all(12.0),
          //     child: Padding(
          //       padding: EdgeInsetsGeometry.all(16),
          //       child: Row(children: [Text('Lunch: ')]),
          //     ),
          //   ),
          //   contents: Padding(
          //     padding: const EdgeInsets.all(12.0),
          //     child: Card(
          //       child: Padding(
          //         padding: EdgeInsetsGeometry.all(16),
          //         child: Column(children: [Text('Start:'), Text('End:')]),
          //       ),
          //     ),
          //   ),
          //   node: TimelineNode(
          //     indicator: DotIndicator(),
          //     endConnector: DashedLineConnector(gap: 3.2),
          //     startConnector: SolidLineConnector(),
          //   ),
          // ),
          // TimelineTile(
          //   oppositeContents: Padding(
          //     padding: const EdgeInsets.all(12.0),
          //     child: Card(
          //       child: Padding(
          //         padding: EdgeInsetsGeometry.all(16),
          //         child: Row(children: [Text('Out: ')]),
          //       ),
          //     ),
          //   ),
          //   contents: Padding(
          //     padding: const EdgeInsets.all(12.0),
          //     child: Card(
          //       child: Padding(
          //         padding: EdgeInsetsGeometry.all(16),
          //         child: Row(
          //           children: [
          //             Text(
          //               tester.values.elementAt(0) == null
          //                   ? '--'
          //                   : DateFormat(
          //                       'h:mm a',
          //                     ).format(tester.values.elementAt(0)!),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          //   node: TimelineNode(
          //     indicator: DotIndicator(),
          //     startConnector: DashedLineConnector(gap: 3.0),
          //     endConnector: DashedLineConnector(gap: 3.0),
          //   ),
          // ),
          // FixedTimeline.tileBuilder(
          //   theme: TimelineThemeData(
          //     connectorTheme: ConnectorThemeData(thickness: 1.6),
          //   ),
          //   builder: TimelineTileBuilder.connectedFromStyle(
          //     contentsBuilder: (context, index) {
          //       final timestamp = tester.values.elementAt(index);
          //       return Card(
          //         child: Padding(
          //           padding: const EdgeInsets.all(21.0),
          //           child: Row(
          //             children: [
          //               Text(
          //                 timestamp == null
          //                     ? '--'
          //                     : DateFormat('h:mm a').format(timestamp),
          //                 style: TextStyle(
          //                   fontSize: 19,
          //                   fontWeight: FontWeight.w300,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       );
          //     },
          //     oppositeContentsBuilder: (context, index) {
          //       return Padding(
          //         padding: const EdgeInsets.all(20.0),
          //         child: Card(
          //           child: Padding(
          //             padding: const EdgeInsets.all(21.0),
          //             child: Row(
          //               children: [
          //                 Text(
          //                   tester.keys.elementAt(index),
          //                   style: TextStyle(
          //                     fontSize: 19,
          //                     fontWeight: FontWeight.w300,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //     contentsAlign: ContentsAlign.basic,
          //     itemCount: 3,
          //     connectionDirection: ConnectionDirection.after,
          //     connectorStyleBuilder: (context, index) {
          //       if (index == 1) {
          //         return ConnectorStyle.dashedLine;
          //       }
          //       return ConnectorStyle.solidLine;
          //     },
          //     indicatorStyleBuilder: (context, index) {
          //       return IndicatorStyle.dot;
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
