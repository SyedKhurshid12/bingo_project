import 'package:bingo_project/screens/bottomNavigationBar/custom_bottom_navigation_bar.dart';
import 'package:bingo_project/screens/theory_page/step_by_step_flow_screen.dart';
import 'package:get/get.dart';

class Routes {
  static String splashScreen = '/';
  static String bottomNavigationScreen = '/bottomNavigationScreen';
  static String stepByStopFlowScreen = '/stepByStopFlowScreen';
}

final getpage = [
  GetPage(
    name: Routes.bottomNavigationScreen,
    page: () => CustomBottomNavigationBar(),
  ),
  GetPage(
    name: Routes.stepByStopFlowScreen,
    page: () => StepByStepFlow(),
  ),
];
