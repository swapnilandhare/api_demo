import 'package:api_demo/api/api_service.dart';
import 'package:api_demo/ui/views/home//home_view.dart';
import 'package:api_demo/ui/views/welcome/welcome_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: WelcomView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
