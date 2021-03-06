import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  PickedFile currentImage;

  @computed
  String get getPath => currentImage.path;

  @action
  void updateCurrentImage(PickedFile image) {
    currentImage = image;
    Modular.to.pushReplacementNamed('/guess', arguments: image);
  }
}
