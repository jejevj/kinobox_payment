import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:kinobox_payment/screen/cash.dart';
import 'package:kinobox_payment/screen/home.dart';
import 'package:kinobox_payment/windows/sample_window.dart';
import 'package:window_manager/window_manager.dart';
import 'extensions/window_controller.dart';
import 'windows/argument.dart';
import 'package:mixin_logger/mixin_logger.dart';
import 'package:fvp/fvp.dart' as fvp;

Future<void> main(List<String> args) async {
  i('App started with arguments: $args');
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  final windowController = await WindowController.fromCurrentEngine();
  windowController.doCustomInitialize();
  final arguments = WindowArguments.fromArguments(windowController.arguments);
  i('Window arguments: $arguments');

  switch (arguments.businessId) {
    case WindowArguments.businessIdMain:
      await windowManager.setTitle("Kinobox Application");
      // windowManager.setFullScreen(true);
      runApp(const MyApp());
    case WindowArguments.businessIdSample:
      WindowOptions windowOptions = const WindowOptions(
        size: Size(250, 110),
        // center: true,
        backgroundColor: Colors.transparent,
        windowButtonVisibility: false,
        alwaysOnTop: true,
        title: "Timer Kinobox",
        skipTaskbar: true,
        titleBarStyle: TitleBarStyle.hidden,
      );
      windowManager.waitUntilReadyToShow(windowOptions, () async {
        await windowManager.show();
        await windowManager.focus();
      });
      runApp(const SampleWindow());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const KinoboxScreen(),
        '/cashScreen': (context) => const CashUI(),
      },
    );
  }
}
