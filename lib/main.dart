import 'package:balanced_meal/Methods/api_request.dart';
import 'package:balanced_meal/pages/WelcomePage.dart';
import 'package:balanced_meal/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocDir.path);
  await Hive.openBox('orders');


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OrderService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const WelcomePage(),
            '/details': (context) => const EnterDetailsPage(),
          },
        );
      },
    );
  }
}
