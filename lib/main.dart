import 'package:bingo_project/AppConstData/setlanguage.dart';
import 'package:bingo_project/AppConstData/string_file.dart';
import 'package:bingo_project/screens/bottomNavigationBar/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AppConstData/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();



  final localeLanuage = await SharedPreferences.getInstance();
  runApp(MyApp(
    prefs: localeLanuage,
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences _localeLanuage;

  const MyApp({Key? key, required SharedPreferences prefs})
      : _localeLanuage = prefs,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleModel(_localeLanuage),
      child: Consumer<LocaleModel>(
        builder: (context, localeModel, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'bkörkortsteori',
            getPages: getpage,
            locale: localeModel.locale,
            initialRoute: Routes.splashScreen,
            translations: AppTranslations(),
            theme: ThemeData(
                useMaterial3: false,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                dividerColor: Colors.transparent,
                fontFamily: "Roboto",
                primaryColor: const Color(0xff1347FF),
                colorScheme: ColorScheme.fromSwatch().copyWith(
                  primary: const Color(0xff194BFB),
                )),
            home: CustomBottomNavigationBar(),
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
