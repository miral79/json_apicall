import 'package:call/fechtdata/apicall.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var editions = <Edition>[].obs;

  @override
  void onInit() {
    fetchData();
    print("miral controller is call");
    super.onInit();
  }

  void fetchData() async {
    isLoading(true); // Start loading

    try {
      var result = await Apicall().fetchData();
      if (result != null) {
        editions.assignAll(result); // More efficient way to update the list
      } else {
        Get.snackbar('Error', 'Failed to load editions');
      }
    } catch (e) {
      print('Error fetching editions: $e');
      Get.snackbar('Error', 'Failed to load editions');
    } finally {
      isLoading(false);
    }
  }
}
