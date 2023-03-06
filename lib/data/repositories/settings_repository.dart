import 'package:prometeo/data/providers/app_settings_provider.dart';

class SettingsRepository {
  String getTempPath() {
    return AppSettingsProvider.tempPath;
  }
}
