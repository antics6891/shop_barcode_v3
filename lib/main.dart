import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/attendance.dart';
// import 'package:shop_barcode_scan_v3/scan_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:toastification/toastification.dart';
import 'package:virtual_keypad/virtual_keypad.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  Intl.defaultLocale = 'en_US';
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://foygqgkfaquhavxptfjl.supabase.co',
    publishableKey: 'sb_publishable_IXt1vYoPUS-GToOhyR0k-w_y3NC19tJ',
  );
  await initializeDateFormatting('en_US', null);
  initializeKeyboardLayouts();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        title: 'Scan Station',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.white),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.all(18)),
              backgroundColor: WidgetStatePropertyAll(Colors.blue.shade700),
              foregroundColor: WidgetStatePropertyAll(Colors.white),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(9),
                ),
              ),
            ),
          ),
        ),
        // home: const ScanScreen(),
        home: Attendance(),
      ),
    );
  }
}
