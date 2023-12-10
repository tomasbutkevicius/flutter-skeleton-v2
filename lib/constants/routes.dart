import 'package:skeleton_231210/models/navigation/navigation_item_model.dart';
import 'package:skeleton_231210/features/auth/screens/login_screen.dart';
import 'package:skeleton_231210/features/home/screens/home_screen.dart';
import 'package:skeleton_231210/features/home/widgets/home_bottom_bar_widget.dart';

class Routes {
  static const String home = '/';
  static const String login = '/login';

  static Map<String, NavigationItem> mapping = {
    Routes.home: NavigationItem(
      body: (_) => const HomeScreen(),
      appBar: (_) => null,
      bottomNavigationBar: (_) => const HomeBottomBarWidget(),
    ),
    Routes.login: NavigationItem(
      body: (_) => const LoginScreen(),
      appBar: (_) => null,
      bottomNavigationBar: (_) => null,
    ),
  };
}
