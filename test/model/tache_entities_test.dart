import 'dart:uri';

import 'package:unittest/unittest.dart';
import 'package:dartlero/dartlero.dart';
import 'package:Gestion_des_taches/dartlero_categorie_taches.dart';

testCategorytaches() {
  Category category;
  group("Testing Category taches: ", () {
    setUp(() {
      CategoryTachesModel categorytachesModel = new CategoryTachesModel();
      categorytachesModel.init();
      Categories categories = categorytachesModel.categories;
      category = categories.find('Dart');
    });
    tearDown(() {
      category.taches.clear();
      expect(category.taches.isEmpty, isTrue);
    });
    test('Add Dart category tache', () {
      var tache = new Tache();
      tache.code = 'Dart Editor';
      category.taches.add(tache);
      category.taches.display('Add Dart category tache');
    });
    test('Add Dart category tache without data', () {
      var tache = new Tache();
      expect(tache, isNotNull);
      var added = category.taches.add(tache);
      expect(added, isTrue);
      category.taches.display('Add Dart category tache without data');
    });
    test('Add Dart category tache that is not unique', () {
      var tache = new Tache();
      tache.code = 'Dart';
      var added = category.taches.add(tache);
      expect(added, isFalse);
      category.taches.display('Add Dart category tache that is not unique');
    });
    test('Find Dart category tache by Dart code', () {
      var searchCode = 'Dart';
      var tache = category.taches.find(searchCode);
      expect(tache, isNotNull);
      expect(tache.code, equals(searchCode));
      tache.display('Find Dart category tache by Dart code');
    });
    test('Order Dart category taches by code', () {
      category.taches.order();
      category.taches.display('Order Dart category taches by code');
    });
    test('Select Dart category taches by programming in description', () {
      var programmingtaches = category.taches.select((tache) => tache.onProgramming);
      expect(programmingtaches.isEmpty, isFalse);
      expect(programmingtaches.length, equals(1));
      programmingtaches.display(
          'Select Dart category taches by programming in description');
    });
  });
}

main() {
  testCategorytaches();
}