// cash.dart (UI version with server and window switching on session_end)
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:kinobox_payment/main.dart';
import 'package:kinobox_payment/screen/home.dart';
import 'package:kinobox_payment/windows/argument.dart';
import 'package:window_manager/window_manager.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart' as shelf_router;
import 'package:http/http.dart' as http; // To send HTTP requests from Flutter
import 'package:flutter/services.dart';

String? currentEventType = "session_end";

// class CashScreen extends StatelessWidget {
//   const CashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(debugShowCheckedModeBanner: false, home: CashUI());
//   }
// }

class CashUI extends StatefulWidget {
  const CashUI({super.key});

  @override
  State<CashUI> createState() => _CashUIState();
}

class _CashUIState extends State<CashUI> with WindowListener {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  TextEditingController _textController = TextEditingController(); // Control
  bool _valid = false;
  FocusNode _textFocusNode = FocusNode(); // 👈 Tambahkan ini
  final FocusNode _focusNode = FocusNode();
  bool _isFullscreen = false;
  @override
  void initState() {
    super.initState();
    // startServer();
    windowManager.addListener(this);
    _focusNode.requestFocus();
    _checkFullscreenStatus();
  }

  @override
  void dispose() {
    _textController.dispose();
    windowManager.removeListener(this);
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _checkFullscreenStatus() async {
    final isFull = await windowManager.isFullScreen();
    if (_isFullscreen != isFull) {
      setState(() {
        _isFullscreen = isFull;
      });
    }
  }

  @override
  void onWindowEvent(String eventName) {
    _checkFullscreenStatus();
  }

  Future<void> _toggleFullscreen() async {
    if (!_isFullscreen) {
      await windowManager.setFullScreen(true);
      await windowManager.setAsFrameless();
      setState(() {
        _isFullscreen = true;
      });
    } else {
      await windowManager.setFullScreen(false);
      // await windowManager.setAsFrameless(false);
      setState(() {
        _isFullscreen = false;
      });
    }
  }

  void _handleKeyEvent(RawKeyEvent event) async {
    if (event is RawKeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.f11) {
        await _toggleFullscreen();
      } else if (event.logicalKey == LogicalKeyboardKey.escape &&
          _isFullscreen) {
        await _toggleFullscreen();
      }
    }
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
          _closeApp();
          switchToThisApp();
        }
        if (eventType == 'session_start') {
          switchToDslr();
        }
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
      final server = await io.serve(handler, '0.0.0.0', 8000, shared: true);
      print('Server running on http://${server.address.host}:${server.port}');
    } catch (e) {
      print('Error starting server: $e');
    }
  }

  Future<void> cekTransaksi(String kodeTrx) async {
    _showSuccessDialog();
    // final url = Uri.parse('https://web-kinobox.hostjeje.com/api/cek-transaksi');

    // try {
    //   final response = await http.post(
    //     url,
    //     headers: {'Content-Type': 'application/json'},
    //     body: jsonEncode({'kode_trx': kodeTrx}),
    //   );

    //   if (response.statusCode == 200) {
    //     final data = jsonDecode(response.body);
    //     print(
    //       '✅ Ditemukan: ${data['data']['nama_barang']} (jumlah: ${data['data']['jumlah']})',
    //     );
    //     // switchToDslr();
    //     _showSuccessDialog();
    //     updateStatuTransaksi(kodeTrx);
    //   } else {
    //     final error = jsonDecode(response.body);
    //     _showFailedDialog();
    //     print('Maaf ❌ ${error['message']}');
    //     await Future.delayed(const Duration(milliseconds: 300));
    //     // Fokuskan kembali ke text field setelah window aktif
    //     if (mounted) {
    //       _textFocusNode.requestFocus();
    //     }

    //     // _showFailedDialog();
    //   }
    // } catch (e) {
    //   print('⚠️ Gagal koneksi ke API: $e');
    // }

    _textFocusNode.requestFocus();
    _textController.clear();
  }

  Future<void> updateStatuTransaksi(String kodeTrx) async {
    final url = Uri.parse('https://web-kinobox.hostjeje.com/api/update-status');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'kode_trx': kodeTrx}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // switchToDslr();
        // _showSuccessDialog();
      } else {
        final error = jsonDecode(response.body);
        // _showFailedDialog();
        print('Maaf ❌ ${error['message']}');

        // _showFailedDialog();
      }
    } catch (e) {
      print('⚠️ Gagal koneksi ke API: $e');
    }
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
        print('[nircmd] Switched to kinobox_payment');

        _textFocusNode.requestFocus();

        FocusScope.of(context).requestFocus(_textFocusNode);

        await Future.delayed(const Duration(milliseconds: 300));
        // Fokuskan kembali ke text field setelah window aktif
        if (mounted) {
          _textFocusNode.requestFocus();

          Navigator.pushNamed(context, '/');
        }
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

  void _showSuccessDialog() {
    int countdown = 6;
    bool _isButtonPressed = false; // Track if the button has been pressed

    AwesomeDialog? dialog;
    late Timer timer;

    dialog = AwesomeDialog(
      context: context,
      customHeader: Image.asset('assets/check.png', height: 150),
      width: 500,
      animType: AnimType.scale,
      title: 'Berhasil! Yuk Siapkan Untuk Snap Out!',

      btnOkOnPress: _isButtonPressed
          ? null // Disable the button if it has been pressed already
          : () {
              setState(() {
                _isButtonPressed = true; // Mark the button as pressed
              });
              dialog?.dismiss(); // Close the dialog after pressing the button
              switchToDslr(); // Execute the switchToDslr() function
            },
      showCloseIcon: false,
      body: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Berhasil Scan QR Kamu!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                "Siap - Siap Snap In!",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          );
        },
      ),
    )..show();
  }

  void _showFailedDialog() {
    int countdown = 4;

    AwesomeDialog? dialog;
    late Timer timer;

    dialog = AwesomeDialog(
      context: context,
      customHeader: Image.asset('assets/error.png', height: 100),
      width: 500,
      animType: AnimType.scale,
      title: 'Kesalahan Input',
      autoHide: Duration(seconds: countdown),
      showCloseIcon: false,
      body: StatefulBuilder(
        builder: (context, setState) {
          timer = Timer.periodic(Duration(seconds: 1), (t) {
            if (countdown == 1) {
              t.cancel();
              dialog?.dismiss(); // Tutup dialog saat countdown selesai
              // Navigator.of(context).pushNamed('/');
            } else {
              setState(() {
                countdown--;
              });
            }
          });

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              const Text(
                "QR Code Tidak Valid / Kedaluwarsa!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 60),
            ],
          );
        },
      ),
    )..show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(_textFocusNode);
                // Tambahkan aksi lain di sini
              },
              child: Image.asset('assets/bg.png', fit: BoxFit.cover),
            ),
          ),

          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const KinoboxScreen(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/home.png',
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12), // Jarak antara tombol
                  Opacity(
                    opacity: 0.2,
                    child: GestureDetector(
                      onTap: () {
                        _toggleFullscreen();
                      },
                      child: Image.asset(
                        'assets/zoom.png',
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Center(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(_textFocusNode);
              },
              child: Image.asset('assets/image4.png', width: 600, height: 700),
            ),
          ),
          Offstage(
            offstage: true,
            child: Opacity(
              opacity: 1,
              child: TextField(
                controller: _textController,
                focusNode: _textFocusNode,
                autofocus: true,
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    cekTransaksi(value);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
