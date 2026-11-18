import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_barcode_scan_v3/api/timecard_service.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:toastification/toastification.dart';

class ClockInBtn extends ConsumerWidget {
  const ClockInBtn({super.key});

  void handleClockIn(int id, BuildContext context) async {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ActionSlider.standard(
      borderWidth: 7,
      backgroundColor: Colors.white,
      toggleColor: Colors.amber,
      sliderBehavior: SliderBehavior.stretch,
      child: Text(
        'Slide To Clock In',
        style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
      ),
      action: (controller) {
        controller.loading();
        final what = TimecardService().createEmployeeTimecard(
          ref.watch(employeeProvider)!.uuid,
        );
        what.then(
          (value) => {
            if (value.isNotEmpty)
              {
                controller.success(),
                // ref.watch(employeeProvider.notifier).clearEmployee(),
                if (context.mounted)
                  {
                    toastification.show(
                      context: context,
                      title: Text('You are Clocked In!'),
                      autoCloseDuration: const Duration(seconds: 2),
                      type: ToastificationType.success,
                      style: ToastificationStyle.flatColored,
                      alignment: Alignment.topCenter,
                      icon: FaIcon(FontAwesomeIcons.hourglassStart),
                      callbacks: ToastificationCallbacks(
                        onAutoCompleteCompleted: (value) {
                          ref.watch(employeeProvider.notifier).clearEmployee();
                        },
                      ),
                    ),
                  },
              },
          },
        );
      },
    );
    // return ElevatedButton(
    //   style: ElevatedButton.styleFrom(padding: EdgeInsets.all(21)),
    //   onPressed: () async {
    //     final what = TimecardService().createEmployeeTimecard(
    //       ref.watch(employeeProvider)!.uuid,
    //     );
    //     what.then(
    //       (value) => {
    //         if (value.isNotEmpty)
    //           {
    //             // ref.watch(employeeProvider.notifier).clearEmployee(),
    //             if (context.mounted)
    //               {
    //                 toastification.show(
    //                   context: context,
    //                   title: Text('You are Clocked In!'),
    //                   autoCloseDuration: const Duration(seconds: 2),
    //                   type: ToastificationType.success,
    //                   style: ToastificationStyle.flatColored,
    //                   alignment: Alignment.topCenter,
    //                   icon: FaIcon(FontAwesomeIcons.hourglassStart),
    //                   callbacks: ToastificationCallbacks(
    //                     onAutoCompleteCompleted: (value) {
    //                       ref.watch(employeeProvider.notifier).clearEmployee();
    //                     },
    //                   ),
    //                 ),
    //               },
    //           },
    //       },
    //     );
    //   },
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Icon(Icons.start),
    //       SizedBox(width: 8),
    //       Text('CLOCK IN', style: TextStyle(fontSize: 16)),
    //     ],
    //   ),
    // );
  }
}
