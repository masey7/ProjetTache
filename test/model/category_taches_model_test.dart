import 'package:unittest/unittest.dart';
import 'package:dartlero/dartlero.dart';
import 'package:Gestion_des_taches/dartlero_categorie_taches.dart';

testModel() {
  CategoryTachesModel categoryTachesModel;
  Categories categories;
  group("Testing Model: ", () {
    setUp(() {
      categoryTachesModel = new CategoryTachesModel();
      categoryTachesModel.init();
      categories = categoryTachesModel.categories;
    });
    tearDown(() {
      categories.clear();
      expect(categories.isEmpty, isTrue);
    });
    test('Display model', () {
      categoryTachesModel.display();
    });
  });
}

main() {
  testModel();
}

