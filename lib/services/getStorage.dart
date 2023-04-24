import 'package:get_storage/get_storage.dart';

class GetStorageServices {
  static final _localStorage = GetStorage();

  saveUserLocally(String val) async {
    await _localStorage.write('user', val);
  }
 
  dynamic getCurrentUser() async {
    return _localStorage.read('user');
  }
 
    dynamic setSession(bool session) async {
    await _localStorage.write('session', session);
  }
      dynamic  getSession() async {
    return _localStorage.read('session');
  }
dynamic removeUser() async {
  await _localStorage.remove('user');
}

}
