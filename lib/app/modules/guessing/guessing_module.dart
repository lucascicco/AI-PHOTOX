import 'package:flutter_modular/flutter_modular.dart';

import 'guessing_controller.dart';
import 'guessing_page.dart';

class GuessingModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) {
          return GuessingController();
        })
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => GuessingPage()),
      ];

  static Inject get to => Inject<GuessingModule>.of();
}
