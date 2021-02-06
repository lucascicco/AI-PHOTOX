import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'guessing_controller.g.dart';

@Injectable()
class GuessingController = _GuessingControllerBase with _$GuessingController;

abstract class _GuessingControllerBase with Store {
  @observable
  ObservableList<bool> listBools = <bool>[].asObservable();

  @computed
  int get listFalse => listBools.where((element) => !element).toList().length;

  @computed
  int get listTrue => listBools.where((element) => element).toList().length;

  @action
  void addBoolean(bool boolean) {
    listBools.add(boolean);
  }
}
