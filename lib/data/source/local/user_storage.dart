import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserStorage extends GetxService {

  final TOKEN_KEY = "token_key";
  final USER_NAME_KEY = "user_name_key";
  late final GetStorage userStorage;
  @override
  void onInit() {
    super.onInit();
    userStorage = GetStorage('USER_STORE');
  }
  Future cacheToken(String token) async {
    return userStorage.write(TOKEN_KEY, token);
  }
  String? get accessToken => userStorage.read(TOKEN_KEY);
  Future cacheUserName(String userName) async {
    return userStorage.write(USER_NAME_KEY, userName);
  }
  String? get userName => userStorage.read(USER_NAME_KEY);
}