import '../../../service/http/http_service.dart';
import '../controller/login_controller.dart';
import '../repository/impl/login_repository_impl.dart';
import '../service/impl/login_service_impl.dart';


class LoginBindings {
  LoginBindings(){
    LoginController(
        repositoryImpl: LoginRepositoryImpl(
            LoginServiceImpl(HttpService())
        )
    );
  }
}