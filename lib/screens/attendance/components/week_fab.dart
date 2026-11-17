import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:signature/signature.dart';

class WeekFab extends StatefulWidget {
  const WeekFab({super.key});

  @override
  State<WeekFab> createState() => _WeekFabState();
}

class _WeekFabState extends State<WeekFab> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.blue.shade500,
    exportBackgroundColor: Colors.white,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: CircleBorder(),
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      child: FaIcon(FontAwesomeIcons.list),
      onPressed: () {
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Weekly Timecard',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Row(children: [Text('Monday')]),
                      Row(children: [Text('Tuesday')]),
                      Row(children: [Text('Wednesday')]),
                      Row(children: [Text('Thursday')]),
                      Row(children: [Text('Friday')]),
                      Signature(
                        placeholder: Text('Sign Here'),
                        backgroundColor: Colors.grey.shade300,
                        controller: _controller,
                        width: MediaQuery.of(context).size.width * .70,
                        height: 160,
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              _controller.clear();
                            },
                            child: Text('Clear'),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('SUBMIT'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
