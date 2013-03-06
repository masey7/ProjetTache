import 'package:unittest/unittest.dart';
import 'package:dartlero/dartlero.dart';
import 'package:Gestion_des_taches/dartlero_categorie_taches.dart';

testModel() {
  CategoryLinksModel categoryLinksModel;
  Categories categories;
  group("Testing Model: ", () {
    setUp(() {
      categoryLinksModel = new CategoryLinksModel();
      categoryLinksModel.init();
      categories = categoryLinksModel.categories;
    });
    tearDown(() {
      categories.clear();
      expect(categories.isEmpty, isTrue);
    });
    test('Display model', () {
      categoryLinksModel.display();
    });
  });
}

main() {
  testModel();
}

