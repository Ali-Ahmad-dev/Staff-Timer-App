import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../home/homeView.dart';
import '../login/loginView.dart';
import '../services/getStorage.dart';

class splashScreenController extends GetxController
{


  static final _services = GetStorageServices();


  dynamic checking_session() async {

    var session = await _services.getSession();
     
     await Future.delayed(Duration(seconds: 2)).then((_) { 
      if (session == true) {


      Get.to(
        () => homeView(),
      );
    } else {
      Get.to(
        () => LoginView(),
      );
    }
    }
     );
     
  }
 
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checking_session();

  }

}