import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  Future<String> getInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    final mapa = deviceInfo.toMap();
    if (mapa.containsKey("androidId")) {
      return mapa["androidId"];
    } else {
      if (mapa.containsKey("computerName")) {
        return "${mapa["computerName"]}${mapa["numberOfCores"]}${mapa["systemMemoryInMegabytes"]}";
      } else {
        return mapa["identifierForVendor"];
      }
    }
  }
}
