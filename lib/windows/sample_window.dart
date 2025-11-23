import 'dart:async';
import 'dart:io'; // For Process.run
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
// cash.dart (UI version with server and window switching on session_end)
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:kinobox_payment/windows/argument.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart' as shelf_router;
import 'package:flutter/services.dart';

// alternatively; if you've only installed forui_assets.
import 'package:forui_assets/forui_assets.dart';
import 'package:window_manager/window_manager.dart';

String? currentEventType = "session_end";

class SampleWindow extends StatefulWidget {
  const SampleWindow({Key? key}) : super(key: key);

  @override
  _SampleWindowState createState() => _SampleWindowState();
}

class _SampleWindowState extends State<SampleWindow> {
  late Timer _timer;
  int _remainingTimeInSeconds = 480; // Start time in seconds (20 seconds)
  bool _isRunning = true;
  bool _serverStarted = false; // Track if server is already running

  @override
  void initState() {
    super.initState();
    // Start the timer automatically when the window is opened
    if (!_serverStarted) {
      startServer();
      _serverStarted = true;
    }
    // Set window position and options once the window is created
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _setWindowPosition();
    });
    _startTimer();
  }

  // Set the window's position to the top center of the screen
  Future<void> _setWindowPosition() async {
    // Get the current window size (250x100) from your options
    final windowSize = Size(250, 110);

    // Get screen dimensions (width and height)
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate the window position for top-center alignment
    final windowX = (screenWidth - windowSize.width) / 2;
    final windowY = 0.0; // Position at the top of the screen

    // Set the window size and position it at the top center
    await windowManager.setSize(windowSize); // Set window size
    await windowManager.setPosition(
      Offset(windowX, windowY),
    ); // Position at the top center
  }

  // Method to start the countdown timer
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTimeInSeconds > 0) {
          _remainingTimeInSeconds--;
        } else {
          _timer.cancel(); // Stop the timer when it reaches 0
          _isRunning = false;
          _closeApp(); // Close the app when the timer reaches 00:00
          // switchToThisApp();
        }
      });
    });
  }

  // Format the time in MM:ss
  String _formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  // Method to close the app using nircmd
  void _closeApp() async {
    // Run the nircmd command to close the app based on the window's title
    await Process.run('nircmd', [
      'win',
      'close',
      'title',
      'Timer Kinobox', // Change this to the exact window title of your app
    ]);
    Navigator.pushNamed(context, '/');
  }

  Future<void> switchToThisApp() async {
    try {
      if (Platform.isWindows) {
        await Process.run('nircmd', [
          'win',
          'activate',
          'title',
          'Kinobox Application',
        ]);
        await Process.run('nircmd', ['win', 'close', 'title', 'Timer Kinobox']);
        print('[nircmd] Switched to kinobox_payment');
        await Future.delayed(const Duration(milliseconds: 300));
      }
    } catch (e) {
      print('[nircmd] Error switching to kinobox_payment: $e');
    }
  }

  Future<void> switchToDslr() async {
    try {
      if (Platform.isWindows) {
        await Process.run('nircmd', [
          'win',
          'activate',
          'title',
          'dslrBooth - Start',
        ]);

        final controller = await WindowController.create(
          WindowConfiguration(
            hiddenAtLaunch: true,
            arguments: const SampleWindowArguments().toArguments(),
          ),
        );
      }
    } catch (e) {
      print('[nircmd] Error switching to kinobox_payment: $e');
    }
  }

  //Server tidak start
  Future<void> startServer() async {
    final router = shelf_router.Router();

    router.get('/', (Request request) {
      var eventType =
          request.url.queryParameters['event_type'] ?? 'session_end';
      final param1 = request.url.queryParameters['param1'] ?? 'unknown';
      final param2 = request.url.queryParameters['param2'] ?? 'unknown';

      print('Request received:');
      print('Event Type: $eventType, Param1: $param1, Param2: $param2');

      if (eventType == 'session_start' || eventType == 'session_end') {
        currentEventType = eventType;
        print('Updated global eventType: $currentEventType');
        if (currentEventType == 'session_end') {
          switchToThisApp();
          // _closeApp();
        }
        // if (eventType == 'session_start') {
        //   switchToDslr();
        // }
      } else {
        eventType = currentEventType!;
      }

      return Response.ok(
        'Received event: $eventType with parameters: $param1, $param2',
      );
    });

    final handler = const Pipeline()
        .addMiddleware(logRequests())
        .addHandler(router);

    try {
      if (!_serverStarted) {
        final server = await io.serve(handler, '0.0.0.0', 8000, shared: true);
        _serverStarted = true; // Mark the server as started
        print('Server running on http://${server.address.host}:${server.port}');
      }
    } catch (e) {
      print('Error starting server: $e');
    }
  }

  @override
  void dispose() {
    // Make sure to cancel the timer when the widget is disposed
    if (_isRunning) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Define the color change when time is below 10 seconds or at 00:00
    bool isCritical = _remainingTimeInSeconds <= 10;
    bool isTimeUp = _remainingTimeInSeconds == 0;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // Change background color based on the timer status
        backgroundColor: const Color.fromARGB(255, 48, 48, 48),
        body: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon on the left
              Icon(
                FIcons.clockFading,
                size: 42,
                color: isTimeUp
                    ? Colors
                          .white // White text when time is up
                    : isCritical
                    ? Colors
                          .red // Red text for critical time
                    : Colors.white, // White text for normal time
              ),
              const SizedBox(
                width: 16,
              ), // Space between the icon and the timer text
              // Timer Text with color change when under 10 seconds
              Text(
                _formatTime(_remainingTimeInSeconds), // MM:ss format
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: isTimeUp
                      ? Colors
                            .white // White text when time is up
                      : isCritical
                      ? Colors
                            .red // Red text for critical time
                      : Colors.white, // White text for normal time
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
