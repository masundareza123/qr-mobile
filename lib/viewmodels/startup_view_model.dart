import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:semangat/constans/const.dart';
import 'package:semangat/constans/route_name.dart';
import 'package:semangat/locator.dart';
import 'package:semangat/services/navigation_service.dart';
import 'package:semangat/services/permission_service.dart';
import 'package:semangat/services/storage_service.dart';
import 'package:semangat/viewmodels/base_model.dart';
import 'package:permission_handler/permission_handler.dart';

class StartUpViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();
  final PermissionsService _permissionsService = locator<PermissionsService>();

  checkPermission() async {
    var _check = _permissionsService.checkStatus(Permission.camera);
    print("data _ $_check");
  }

  Future<String> get localPath async {
    final dir = await getExternalStorageDirectory();
    String dirs = dir.path + "/report";
    print("fold");
    print(dirs);
    return dirs;
  }

  createFolder() async {
    final dir = await getExternalStorageDirectory();
    String dirs = dir.path + "/report";
    print("fold");
    print(dirs);
    final Directory path = Directory(dirs);
    bool exists = await path.exists();

    if (!exists) {
      path.create();
    }
  }

  startTimer() async {
    var _duration = Duration(seconds: 5);
    createFolder();
    return Timer(_duration, handleStartUpLogic);
  }

  Future handleStartUpLogic() async {
    final data = await _storageService.getString(K_GUID);

    if (data == null) {
      _navigationService.replaceTo(LoginViewRoute);
    } else {
      _navigationService.replaceTo(HomeViewRoute);
    }
  }
}