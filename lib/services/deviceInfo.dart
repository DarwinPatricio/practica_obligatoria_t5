import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  Future<Map<String, dynamic>> getInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    final map = deviceInfo.toMap();
    return map;
  }
}
