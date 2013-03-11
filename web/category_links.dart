import 'dart:html';
import 'dart:json';

import 'package:dartlero/dartlero.dart';
import 'package:Gestion_des_taches/dartlero_categorie_taches.dart';

CategoryTachesModel categoryTachesModel;
Categories categories;

load() {
  String json = window.localStorage['dartlero_categorie_taches'];
  if (json == null) {
    categoryTachesModel.init();
  } else {
    categories.fromJson(parse(json));
    if (categories.length == 0) {
      categoryTachesModel.init();
    }
  }
  categories.order();
}

main() {
  categoryTachesModel = new CategoryTachesModel();
  categories = categoryTachesModel.categories;
  load();
}

