import 'dart:io';

import 'package:flutter/material.dart';
import 'package:squadmobile_base_project/app/app.dart';
import 'package:squadmobile_base_project/app/config/dependences_injector/dependences_injector.dart';
import 'package:squadmobile_base_project/app/config/jail_broken/jail_broken.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencesInjector.setupDependencies();
  if (await JailBroken.isRooted()) exit(exitCode);
  runApp(const BaseApp());
}
