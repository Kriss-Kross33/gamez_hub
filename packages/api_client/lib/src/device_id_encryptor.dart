import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:device_info/device_info.dart';

class DeviceIdEncryptor {
  static Future<String?> fetchDeviceData() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        return _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        return _readIOSBuildData(await deviceInfoPlugin.iosInfo);
      }
    } on Exception {
      return null;
    }
    return null;
  }

  static String _readAndroidBuildData(AndroidDeviceInfo androidDeviceInfo) {
    final deviceData = <String, dynamic>{};
    deviceData['phoneModel'] = androidDeviceInfo.model;
    deviceData['source'] = 'android';
    deviceData['manufacturer'] = androidDeviceInfo.manufacturer;
    deviceData['identifier'] = androidDeviceInfo.androidId;
    final encodedDeviceData = _convertDataToSha256(deviceData);
    return encodedDeviceData;
    // deviceData['fingerPrint'] = encodedDeviceData;
    //String encodeData = json.encode(encodedDeviceData);
    // return json.encode(encodeData);
  }

  static String _readIOSBuildData(IosDeviceInfo iosDeviceInfo) {
    final deviceData = <String, dynamic>{};
    deviceData['phoneModel'] = iosDeviceInfo.model;
    deviceData['manufacturer'] = 'apple';
    deviceData['source'] = 'ios';
    deviceData['identifier'] = iosDeviceInfo.identifierForVendor;
    final encodedDeviceData = _convertDataToSha256(deviceData);
    return encodedDeviceData;
    // deviceData['fingerPrint'] = encodedDeviceData;
    // String encodeData = json.encode(deviceData);
    // return json.encode(encodeData);
  }

  static String _convertDataToSha256(Map<String, dynamic> deviceData) {
    final encodedDeviceData = jsonEncode(deviceData);
    final bytes = utf8.encode(encodedDeviceData);
    final digest = sha256.convert(bytes);
    return '$digest';
  }
}
