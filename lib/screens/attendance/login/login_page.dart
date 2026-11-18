import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/api/auth_service.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: Column(
            spacing: 7,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text('LOGIN', style: TextStyle(fontSize: 40)),
              ),
              TextField(
                style: TextStyle(fontSize: 23),
                controller: _emailController,
                decoration: InputDecoration(
                  label: Text('Email'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),
              TextField(
                style: TextStyle(fontSize: 23),
                controller: _passwordController,
                decoration: InputDecoration(
                  label: Text('Password'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 21),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await AuthService().signInEmail(
                        _emailController.text,
                        _passwordController.text,
                      );
                    } catch (e) {
                      _emailController.clear();
                      _passwordController.clear();
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Check Credentials and Retry!'),
                          ),
                        );
                      }
                    }
                  },
                  child: Text('SUBMIT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
