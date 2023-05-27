import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart ';
import 'package:provider/provider.dart';
import 'package:trade_brains/view/main_screen.dart';
import 'package:trade_brains/view_model/company_view_model.dart';
import 'package:trade_brains/view_model/main_view_model.dart';
import 'package:trade_brains/view_model/watchlist_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox<String>('watchListDB');

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CompanyViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => WatchListViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trade Brains',
        theme: ThemeData(
          primaryColor: Colors.grey[900],
        ),
        home: MainScreen(),
      ),
    );
  }
}
