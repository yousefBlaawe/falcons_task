import 'package:bloc/bloc.dart';
import 'package:falcons_task/core/services/server_locator.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'core/services/dio.dart';
import 'core/utils/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServerLocator().inti();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(const App());
}
