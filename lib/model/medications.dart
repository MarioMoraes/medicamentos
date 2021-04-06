import 'package:app_bluestorm/helpers/singleton.dart';
import 'package:app_bluestorm/model/MedicationsModel.dart';
import 'package:app_bluestorm/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Medications extends GetxController {
  String query = "";

  int limit = 50;
  String token;

  var listMedications = [].obs;
  var isLoading = true.obs;
  RxInt pg = 1.obs;

  AuthService authService = AuthService();
  Dio dio = Dio();

  @override
  void onInit() {
    getAllMedications();
    super.onInit();
  }

  Future<void> getAllMedications() async {
    try {
      isLoading(true);
      token = Singleton.instance.tokenData;

      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["Authorization"] = "Bearer $token";

      dio.options.queryParameters = {'page': pg.value, 'limit': limit};

      final response = await dio.get(
          'https://djbnrrib9e.execute-api.us-east-2.amazonaws.com/v1/medications');

      pg.value = response.data['page'];

      listMedications.value = (response.data['items'])
          .map<Item>((item) => Item.fromJson(item))
          .toList();
    } on DioError catch (e) {
      print(e.message);
    }
    isLoading(false);
  }

  void nextPage() {
    pg.value = pg.value + 1;
    getAllMedications();
  }

  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }
}
