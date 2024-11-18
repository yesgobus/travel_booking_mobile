import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetStoreData extends GetxController{
  static var getStore = GetStorage();
  
  static void storeUserData({
    required String id,
    required String name,
    required String phone,
    required String email,
    required String authToken,
  }) {
    getStore.write('access_token', authToken);
    getStore.write('id', id);
    getStore.write('phone', phone);
    getStore.write('name', name);
    getStore.write('email',email);
  }
}
