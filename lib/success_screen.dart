import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/form_success.png',
                height: 200,
                width: 200,
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'SUCCESS !',
            style: TextStyle(fontSize: 32, color: Colors.green.shade800),
          ),
        ],
      ),
    );
  }
}
