import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'shared_controller.g.dart';

@Injectable()
class SharedController = _SharedControllerBase with _$SharedController;

abstract class _SharedControllerBase with Store {
  @observable
  PickedFile currentImage;

  @observable
  ObservableList<bool> listBools = <bool>[].asObservable();

  @computed
  int get listFalse => listBools.where((element) => !element).toList().length;

  @computed
  int get listTrue => listBools.where((element) => element).toList().length;

  @computed
  String get getPath => currentImage.path;

  @action
  void updateCurrentImage(PickedFile image) {
    currentImage = image;
    Modular.to.pushReplacementNamed('/guess', arguments: image);
  }

  @action
  void addBoolean(bool boolean) {
    listBools.add(boolean);
  }
}
