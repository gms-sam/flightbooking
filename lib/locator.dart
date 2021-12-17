import 'package:flightbooking/services/authenticationServices.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setUpLocator(){
  locator.registerLazySingleton(() => AuthenticationServices());
}