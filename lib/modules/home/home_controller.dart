import 'package:get/get.dart';

import '../../service/api/home/home_repository.dart';

class HomeController extends GetxController {

  HomeController({
    this.homeRepository
  });

  final HomeRepository? homeRepository;

}