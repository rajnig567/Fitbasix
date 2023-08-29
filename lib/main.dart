
import 'dart:ui' as ui;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fitbasix/app_bindings.dart';
import 'package:fitbasix/screens/exercise_page.dart';
import 'package:fitbasix/utils/connectivity.dart';
import 'package:fitbasix/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final MyConnectivity _connectivity = MyConnectivity.instance;

  @override
  void initState() {
    _connectivity.initialise();
    super.initState();
  }

  @override
  void dispose() {
    _connectivity.disposeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GetMaterialApp(
          title: 'FitBasicX',
          debugShowCheckedModeBanner: false,
          initialBinding: AppBindings(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ExercisePage(),
        ),
        Align(alignment: Alignment.topCenter, child: noInternet()),
      ],
    );
  }

  Widget noInternet() {
    return StreamBuilder<dynamic>(
        stream: _connectivity.myStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData &&
              snapshot.data.keys.toList()[0] as ConnectivityResult ==
                  ConnectivityResult.none) {
            return Directionality(
              textDirection: ui.TextDirection.ltr,
              child: Container(
                  width: double.infinity,
                  height: 104,
                  color: Colors.red,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.warning_amber,
                            color: Colors.white,
                          ),
                          12.widthSizedBox,
                          const Expanded(
                            child: Text(
                              'You must connect to Wi-fi or a Cellular Network to get online again',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ).paddingAll(16),
                    ],
                  )),
            );
          } else {
            return Container();
          }
        });
  }
}
