import 'package:favorite_list/hero_model.dart';
import 'package:flutter/cupertino.dart';

class HeroesController extends ChangeNotifier {
  List<HeroModel> heroes = [
    //Vamos enviar via Provider
    HeroModel(name: 'Mulher Maravilha'),
    HeroModel(name: 'Mulher Invisível'),
    HeroModel(name: 'Capitã Marvel'),
    HeroModel(name: 'Viúva Negra'),
    HeroModel(name: 'Tempestade'),
    HeroModel(name: 'Gamora'),
  ];

  checkFavorite(HeroModel model) {
    model.isFavorite = !model.isFavorite!;
    notifyListeners();
  }
}
