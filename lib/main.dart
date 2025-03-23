import 'package:authentication/app.dart';
import 'package:authentication/dependencies/service_locator.dart';

import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupServiceLocator();

  runApp(MyApp());
}
