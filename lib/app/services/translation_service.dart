import 'dart:async';
import './translation_contract.dart';
import 'package:translator/translator.dart';

class GetDataTranslation implements TranslationContract {
  @override
  Future<List<String>> getTranslation(List<String> translations) async {
    try {
      final translator = GoogleTranslator();
      String toBeTranslated = translations.toString();

      var translatedText =
          await translator.translate(toBeTranslated, from: 'en', to: 'pt');

      return translatedText.text.split(',').toList();
    } catch (e) {
      return null;
    }
  }
}
