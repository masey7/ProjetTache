library ComposantesCommuns;

import 'dart:html';
import 'dart:json';

import 'package:dartlero/dartlero.dart';
import 'package:Gestion_des_taches/dartlero_categorie_taches.dart';

sauvegarder(categories) {
  window.localStorage['dartlero_categorie_taches'] =
      stringify(categories.toJson());
}