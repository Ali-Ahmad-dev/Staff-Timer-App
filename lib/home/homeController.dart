import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:timefolio/home/homeView.dart';
import 'package:timefolio/login/loginView.dart';

import '../services/firestoreServices.dart';
import '../services/getStorage.dart';

class homeController extends GetxController {
  final _getStorage = GetStorageServices();
  final _services = firestoreServices();
  final users = <dynamic>[].obs;

  RxString currentUser = '-------'.obs;
  RxString active = ''.obs;
  RxString checkInTime = '-----'.obs;
  RxString checkOutTime = '-----'.obs;

  RxString status = ''.obs;
  RxBool isLoading = false.obs;

  RxString totalTime = '-----'.obs;

  getCurrentUser() async {
    isLoading.value = true;
    final user = await _getStorage.getCurrentUser();
    print(user);
    final s = await _services.getUserName(user);
    currentUser.value = s;
    print(currentUser.value);
  }

  logOut() async {
    await _getStorage.setSession(false);
    await _getStorage.removeUser();

    Get.delete<homeController>();
    Get.to(() => LoginView());
  }

  void checkIn() async {
    String user = await _getStorage.getCurrentUser();
    await _services.userCheckIn(user);
    var s = await _services.getCheckInDate(user);
    print(s);
    checkInTime.value = s;
  }

  checkOut() async {
    String user = await _getStorage.getCurrentUser();
    await _services.checkOut(user);
    final x1 = await _services.getCheckInDate(user);
    final s1 = DateFormat.jm().parse(x1);
    final y1 = await _services.getCheckOutDate(user);
    checkOutTime.value = y1.toString();
    final s = DateFormat.jm().parse(y1);

    var c = s.difference(s1);
    await _services.checkOutTimeDiff(user, '${c.inHours} Hrs');
    totalTime.value = c.inHours.toString();
  }

  fetchUserStatus() async {
    final user = await _getStorage.getCurrentUser();
    final res = await _services.fetchUserStatus(user);

    print(res);
    if (res.toString() == 'true') {
      status.value = 'true';
      checkInTime.value = await _services.getCheckInDate(user);
    } else if (res.toString() == 'false') {
      status.value = 'false';
      checkInTime.value = await _services.getCheckInDate(user);
      checkOutTime.value = await _services.getCheckOutDate(user);
      totalTime.value = await _services.getDiff(user);
    } else {
      status.value = 'null';
    }

    isLoading.value = false;
  }

  @override
  void onInit() {
    fetchUserStatus();
    getCurrentUser();
    // TODO: implement onInit
  }
}
