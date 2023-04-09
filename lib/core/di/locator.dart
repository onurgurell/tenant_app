import 'package:get_it/get_it.dart';
import 'package:tenant_app/view_model/express_yourself_view_model.dart';

GetIt locator = GetIt.instance;

setupLocator() async {
  locator.registerLazySingleton(() => ExpressYourselfViewModel());
}
