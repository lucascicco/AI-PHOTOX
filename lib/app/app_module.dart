import 'package:Aiphotox/app/modules/guessing/guessing_controller.dart';
import 'package:Aiphotox/app/modules/home/home_controller.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import '../app/app_widget.dart';
import '../app/modules/home/home_module.dart';
import 'modules/guessing/guessing_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds =>
      [Bind((i) => HomeController()), Bind((i) => GuessingController())];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter('/guess', module: GuessingModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
