import 'package:authentication/core/constant/const_string.dart';
import 'package:authentication/core/routes/route_names.dart';
import 'package:authentication/dependencies/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text(
                firebaseAut.currentUser!.displayName!,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 3.h),
              TextButton(
                onPressed: () {
                  
                },
                child: Text('Sign out'),
              ),
              SizedBox(height: 3.h),
              TextButton(
                onPressed: () {
                  context.push(RoutePath.forget, extra: accountDelete);
                },
                child: Text('Delete'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
