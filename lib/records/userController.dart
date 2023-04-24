import 'package:get/state_manager.dart';

import '../services/firestoreServices.dart';

class userController extends GetxController{
  RxBool hidePassword = true.obs;

  static final _services = firestoreServices();
 final dates = <dynamic>[].obs;
   RxBool isLoading = false.obs;


 fetchDates() async {
  isLoading.value = true;
  List list = await _services.fetchDateRecords();
  for (var i = 0; i <  list.length; i++) {
    dates.add(list[i]);
  }
  isLoading.value = false;
 }

  @override
  void onInit() {
    fetchDates();
 
    // TODO: implement onInit
    super.onInit();
  }
}