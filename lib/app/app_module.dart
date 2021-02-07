import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import '../app/app_widget.dart';
import 'modules/home/home_module.dart';
import 'modules/guessing/guessing_module.dart';
import 'modules/loading/loading_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (i, args) => LoadingPage()),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/guess', module: GuessingModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
