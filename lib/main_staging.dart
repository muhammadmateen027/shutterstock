import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

import 'package:shutterstock/app/app.dart';

import 'config/config.dart';

void main() async{
  Bloc.observer = AppBlocObserver();
  final repository = await Initialization.init();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
        () => runApp(App(repository: repository)),
        (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
