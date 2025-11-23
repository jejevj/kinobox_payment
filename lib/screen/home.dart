import 'dart:async';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kinobox_payment/screen/cash.dart';
import 'package:shelf/shelf.dart';
import 'package:http/http.dart' as http;
import 'package:shelf/shelf_io.dart' as io;
import 'dart:convert';
import 'package:shelf_router/shelf_router.dart' as shelf_router;
import 'package:crypto/crypto.dart';
import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:window_manager/window_manager.dart';

String? currentEventType = "session_end";

class KinoboxScreen extends StatefulWidget {
  const KinoboxScreen({super.key});

  @override
  State<KinoboxScreen> createState() => _KinoboxScreenState();
}

class _KinoboxScreenState extends State<KinoboxScreen> with WindowListener {
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

  void _showComingSoonDialog() {
    int countdown = 4;
    AwesomeDialog? dialog;
    late Timer timer;

    dialog = AwesomeDialog(
      context: context,
      customHeader: Image.asset('assets/warning.png', height: 80),
      width: 500,
      animType: AnimType.scale,
      title: 'Oops!',
      autoHide: Duration(seconds: countdown),
      showCloseIcon: false,
      body: StatefulBuilder(
        builder: (context, setState) {
          timer = Timer.periodic(const Duration(seconds: 1), (t) {
            if (countdown == 1) {
              t.cancel();
              dialog?.dismiss();
            } else {
              setState(() {
                countdown--;
              });
            }
          });

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBox(height: 30),
              Text(
                "Fitur Ini Belum Tersedia, Coba lagi nanti ya!",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Text(
                "Silahkan ke Kasir untuk Transaksi!",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 60),
            ],
          );
        },
      ),
    )..show();
  }

  void _showSuccessDialog() {
    AwesomeDialog? dialog;
    bool _isButtonPressed = false; // Track if the button has been pressed
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

  // Generate HMACSHA256 signature in Dart
  Future<String> _generateSignature(
    Map<String, dynamic> requestBody,
    String requestId,
    String requestTimestamp,
  ) async {
    String jsonBody = jsonEncode(requestBody);
    var digestSHA256 = sha256.convert(utf8.encode(jsonBody));
    String digestBase64 = base64Encode(digestSHA256.bytes);

    String signatureComponents =
        'Client-Id:BRN-0204-1754870435962\n' +
        'Request-Id:$requestId\n' +
        'Request-Timestamp:$requestTimestamp\n' +
        'Request-Target:/checkout/v1/payment\n' +
        'Digest:$digestBase64';

    var secretKey =
        "SK-6THgGXUdopFdfOCm8wTp"; // Replace with your actual secret key
    var hmac = Hmac(sha256, utf8.encode(secretKey));
    var signatureHmacSha256 = hmac.convert(utf8.encode(signatureComponents));
    return base64Encode(signatureHmacSha256.bytes);
  }

  // Function to send API request
  Future<void> _makePaymentRequest() async {
    String requestId = DateTime.now().millisecondsSinceEpoch.toString();
    // String requestTimestamp = DateTime.now().toIso8601String();
    // Get current time in UTC and remove milliseconds
    DateTime nowUtc = DateTime.now().toUtc();

    // Format the timestamp to match the required format: YYYY-MM-DDTHH:MM:SSZ
    String requestTimestamp = "${nowUtc.toIso8601String().substring(0, 19)}Z";

    var requestBody = {
      "order": {
        "amount": 35000,
        "invoice_number": "INV-${DateTime.now().millisecondsSinceEpoch}",
      },
      "payment": {
        "payment_due_date": 1,
        "payment_method_types": ["QRIS"],
      },
    };

    // Generate the signature for the request
    String signature = await _generateSignature(
      requestBody,
      requestId,
      requestTimestamp,
    );

    print(requestTimestamp);
    var headers = {
      'Client-Id': 'BRN-0204-1754870435962',
      'Request-Id': requestId,
      'Request-Timestamp': requestTimestamp,
      'Signature': 'HMACSHA256=$signature',
      'Content-Type': 'application/json',
    };

    var response = await http.post(
      Uri.parse('https://api.doku.com/checkout/v1/payment'),
      headers: headers,
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      String tokenId = responseData['response']['payment']['token_id'];
      String url = responseData['response']['payment']['url'];
      _openQRISWebViewWindow(url, tokenId);
    } else {
      // Handle failure
      print('Payment request failed: ${response.body}');
    }
  }

  // Function to open the WebView for QRIS

  void _openQRISWebViewWindow(String url, String tokenId) async {
    final webview = await WebviewWindow.create(
      configuration: CreateConfiguration(
        windowHeight: 800,
        windowWidth: 600,
        title: "QRIS Payment",
        titleBarTopPadding: Platform.isMacOS ? 20 : 0,
      ),
    );

    webview
      ..setApplicationNameForUserAgent("KinoboxApp/1.0.0")
      ..launch(url) // Launch the payment URL
      ..addOnUrlRequestCallback((url) {
        debugPrint('WebView URL: $url');
      })
      ..onClose.whenComplete(() {
        debugPrint("WebView window closed");
      });

    // Start checking payment status every second
    Timer.periodic(Duration(milliseconds: 500), (timer) async {
      final status = await checkPaymentStatus(tokenId);

      if (status == "PAID") {
        // Close the WebView when status is EXPIRED or SUCCESS
        webview.close();
        timer.cancel(); // Stop the timer
        debugPrint("Payment status: $status. WebView closed.");
        _showSuccessDialog();
      }
      if (status == "EXPIRED") {
        // Close the WebView when status is EXPIRED or SUCCESS
        webview.close();
        timer.cancel(); // Stop the timer
        debugPrint("Payment status: $status. WebView closed.");
      }
    });
  }

  // Function to check the payment status
  Future<String> checkPaymentStatus(String tokenId) async {
    final url =
        'https://checkout.doku.com/checkout/v1/payment/$tokenId/check-status';
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data['status']);
        return data['status']; // Return the status from the response
      } else {
        debugPrint("Failed to fetch payment status: ${response.statusCode}");
        return "ERROR"; // Handle error if needed
      }
    } catch (e) {
      debugPrint("Error checking payment status: $e");
      return "ERROR"; // Handle any exceptions
    }
  }

  // Show QRIS Dialog and make payment request
  void _showQRISDialog() async {
    int countdown = 10;
    AwesomeDialog? dialog;

    dialog = AwesomeDialog(
      context: context,
      customHeader: Image.asset('assets/warning.png', height: 80),
      width: 500,
      animType: AnimType.scale,
      title: 'QRIS Payment',
      autoHide: Duration(seconds: countdown),
      showCloseIcon: false,
      body: StatefulBuilder(
        builder: (context, setState) {
          Timer.periodic(const Duration(seconds: 1), (t) {
            if (countdown == 1) {
              t.cancel();
              dialog?.dismiss();
            } else {
              setState(() {
                countdown--;
              });
            }
          });

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30),
              Text(
                "Memproses Pembayaran QRIS.",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Text(
                "Silahkan tunggu sampai QRIS muncul, waktu kamu 1 menit untuk melakukan pembayaran! ",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 60),
            ],
          );
        },
      ),
    )..show();

    // Make the payment request
    await _makePaymentRequest();
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

        await Future.delayed(const Duration(milliseconds: 300));
        // Fokuskan kembali ke text field setelah window aktif
        if (mounted) {
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

        print('[nircmd] Switched to Dslr');
      }
    } catch (e) {
      print('[nircmd] Error switching to kinobox_payment: $e');
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
          switchToThisApp();
          _closeApp();
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

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: _handleKeyEvent,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/bg.png', fit: BoxFit.cover),
            ),

            // ✅ TOMBOL ZOOM (SELALU MUNCUL)
            Align(
              alignment: Alignment.topRight,
              child: Opacity(
                opacity: 0.2,
                child: GestureDetector(
                  onTap: () {
                    _toggleFullscreen();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      'assets/zoom.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
              ),
            ),

            // ✅ TAMPILKAN PERINGATAN JIKA TIDAK FULLSCREEN
            if (!_isFullscreen)
              const Center(
                child: Text(
                  'Harap tekan icon zoom untuk menjalankan aplikasi',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 121, 111, 111),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

            // ✅ TAMPILAN UTAMA SAAT FULLSCREEN
            if (_isFullscreen)
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CashUI(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/image1.png',
                        width: 370,
                        height: 420,
                      ),
                    ),
                    const SizedBox(width: 80),
                    GestureDetector(
                      onTap: _showQRISDialog,
                      child: Image.asset(
                        'assets/image2.png',
                        width: 370,
                        height: 420,
                      ),
                    ),
                    const SizedBox(width: 80),
                    GestureDetector(
                      onTap: _showComingSoonDialog,
                      child: Image.asset(
                        'assets/image3.png',
                        width: 370,
                        height: 420,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
