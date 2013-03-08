import 'dart:html';
import 'dart:json';

import 'package:dartlero/dartlero.dart';
import 'package:Gestion_des_taches/dartlero_categorie_taches.dart';

CategoryLinksModel categoryLinksModel;
Categories categories;

load() {
  String json = window.localStorage['dartlero_categorie_taches'];
  if (json == null) {
    categoryLinksModel.init();
  } else {
    categories.fromJson(parse(json));
    if (categories.length == 0) {
      categoryLinksModel.init();
    }
  }
  categories.order();
}

main() {
  categoryLinksModel = new CategoryLinksModel();
  categories = categoryLinksModel.categories;
  load();
}

