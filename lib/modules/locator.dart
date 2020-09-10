import 'package:flyrics/api/api.dart';
import 'package:flyrics/api/shell_api.dart';
import 'package:flyrics/controllers/track_controller.dart';
import 'package:flyrics/modules/app_logger.dart';
import 'package:flyrics/modules/config.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

final I = GetIt.asNewInstance();

Future setupLocator() async {
  final config = await Config.init();

  I.registerSingleton<Api>(Api(config));
  I.registerSingleton<Terminal>(Terminal());
  I.registerSingleton<AppLogger>(AppLogger());

  Get.put<TrackController>(TrackController());
  // Get.put<ArtworkController>(ArtworkController());
}
