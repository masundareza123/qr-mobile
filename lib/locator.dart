import 'package:semangat/services/alert_service.dart';
import 'package:semangat/services/api_service.dart';
import 'package:semangat/services/navigation_service.dart';
import 'package:semangat/services/storage_service.dart';
import 'package:semangat/services/permission_service.dart';
import 'package:semangat/services/guid_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
locator.registerLazySingleton(() => AlertService());
locator.registerLazySingleton(() => ApiService());
locator.registerLazySingleton(() => NavigationService());
locator.registerLazySingleton(() => StorageService());
locator.registerLazySingleton(() => PermissionsService());
locator.registerLazySingleton(() => GuidService());
}