import 'package:app/service/api/home/home_repository.dart';
import 'package:app/service/api/home/home_service.dart';
import 'package:app/service/http/http_service.dart';
import 'package:get/get.dart';

import 'home_controller.dart';
import 'home_view_model.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {

    Get.put(HomeController(
      homeRepository: HomeRepository(
        service: HomeService(
          httpService: HttpService()
        )
      )
    ));

    Get.put(HomeViewModel());

  }
}