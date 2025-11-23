// TODO Implement this library.
import 'dart:convert';

abstract class WindowArguments {
  const WindowArguments();

  static const String businessIdMain = 'main';
  static const String businessIdSample = 'sample';

  factory WindowArguments.fromArguments(String arguments) {
    if (arguments == '') {
      return const MainWindowArguments();
    }
    final json = jsonDecode(arguments) as Map<String, dynamic>;
    final businessId = json['businessId'] as String? ?? '';
    switch (businessId) {
      case businessIdSample:
        return SampleWindowArguments.fromJson(json);
      default:
        throw Exception('Unknown businessId: $businessId');
    }
  }

  Map<String, dynamic> toJson();

  String get businessId;

  String toArguments() => jsonEncode({"businessId": businessId, ...toJson()});

  @override
  String toString() {
    return 'WindowArguments(businessId: $businessId, data: ${toJson()})';
  }
}

class MainWindowArguments extends WindowArguments {
  const MainWindowArguments();

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get businessId => WindowArguments.businessIdMain;
}

class SampleWindowArguments extends WindowArguments {
  const SampleWindowArguments();

  factory SampleWindowArguments.fromJson(Map<String, dynamic> json) {
    return const SampleWindowArguments();
  }

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get businessId => WindowArguments.businessIdSample;
}
