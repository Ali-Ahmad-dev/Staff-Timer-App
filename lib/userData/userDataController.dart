import 'package:get/get.dart';
import '../services/firestoreServices.dart';
 
class userDataController extends GetxController {

  final data = Get.arguments;
  static final _services = firestoreServices();
   final userdetails = <dynamic>[].obs;
   RxBool isLoading = false.obs;

  dynamic usersDetails() async {

    isLoading.value = true;
     
  List d =  await _services.fetchUsersData(data, );
    userdetails.value = await d;

    print(userdetails);
    isLoading.value = false;

  }
 
  @override
  void onInit() {
  usersDetails();
    // TODO: implement onInit
    super.onInit();
  }
}
