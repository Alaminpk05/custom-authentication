

import 'package:authentication/core/routes/app_router.dart';
import 'package:authentication/core/services/objectbox/open_store.dart';
import 'package:authentication/core/utils/helpers/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final getIt = GetIt.instance;


Future<void> setupServiceLocator() async {
  try {
    final objectBox = await ObjectBox.create();
    getIt.registerFactory<InternetConnection>(()=> InternetConnection());
    getIt.registerSingleton<ObjectBox>(objectBox);
    
    // getIt.registerSingleton<AuthContract>(AuthService());
    


    getIt.registerLazySingleton<CustomSnackbar>(() => CustomSnackbar());

    getIt.registerLazySingleton(() => AppRouter.router);
  } catch (e) {
    debugPrint("Error during dependency setup: $e");
    rethrow;
  }
}

//// GLOBAL INSTANCE FOR ACCESSING ACROSS THE APP
InternetConnection get internetConnection => getIt<InternetConnection>();
ObjectBox get objectBox => getIt<ObjectBox>();
// AuthContract get authServices => getIt<AuthContract>();
CustomSnackbar get customSnackBar => getIt<CustomSnackbar>();
AppRouter get appRouter => getIt<AppRouter>();


