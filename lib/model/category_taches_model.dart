part of dartlero_category_tache;

class CategoryTachesModel extends ConceptModel {
  
  static final String category = 'Category';

  Map<String, ConceptEntities> newEntries() {
    var categories = new Categories();
    var map = new Map<String, ConceptEntities>();
    map[category] = categories;
    return map;
  }

  Categories get categories => getEntry(category);

  init() {
    var webCategory = new Category();
    webCategory.code = 'Etudes';
    webCategory.description = 'Relatif à mon MBA';
    categories.add(webCategory);

    var webCategoryTaches = webCategory.taches;
    var travailCoursArchitecture = new Tache();
    travailCoursArchitecture.code = 'Travail de Session';
    travailCoursArchitecture.description =
        'Travail en architecture sur cas ABC';
    travailCoursArchitecture.date = new DateTime(2013, 3, 19);
    webCategoryTaches.add(travailCoursArchitecture);

    var examensArchitecture = new Tache();
    examensArchitecture.code = 'Examens de Mi-session';
    examensArchitecture.description =
        'Cet examens portera sur la méthode ADN.';
    examensArchitecture.date = new DateTime(2013, 3, 21);
    webCategoryTaches.add(examensArchitecture);

    var dartCategory = new Category();
    dartCategory.code = 'Travail';
    dartCategory.description = 'Relatif à mon emplois';
    categories.add(dartCategory);

    var dartCategoryLinks = dartCategory.taches;
    var developperApplicationTachesCategory = new Tache();
    developperApplicationTachesCategory.code = 'Application Tâches';
    developperApplicationTachesCategory.description =
        'Développer une application permettant de gérer des tâches';
    developperApplicationTachesCategory.date = new DateTime(2013, 3, 30);
    dartCategoryLinks.add(developperApplicationTachesCategory);

    var formerNouvelleRessource = new Tache();
    formerNouvelleRessource.code = 'Former nouvelle ressource';
    formerNouvelleRessource.description =
        'Former Ali, le nouveau de notre Direction.';
    formerNouvelleRessource.date = new DateTime(2013, 3, 25);
    dartCategoryLinks.add(formerNouvelleRessource);
  }
  
  display() {
    print('Category Taches Model');
    print('====================');
    for (var category in categories) {
      print('  Category');
      print('  -----');
      print(category.toString());
      print('    Taches');
      print('    -----');
      for (var tache in category.taches) {
        print(tache.toString());
      }
    }
    print(
      '============= ============= ============= '
      '============= ============= ============= '
    );
  }

}
