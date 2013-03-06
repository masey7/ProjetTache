import 'dart:html';

import  '../compo_commun/sauvegarde.dart'  as  ComposantesCommuns;
import 'package:Gestion_des_taches/dartlero_categorie_taches.dart';
import 'package:web_ui/web_ui.dart';

class CategoryTable extends WebComponent {
  Categories categories;
  Category category;
  
  bool showCategoryLinks = false;
  bool displayCategory = true;
  bool editCategory = false;
  
  update() {
    InputElement description = query('#edit-category-description');
    category.description = description.value;
    var categoryTable = document.query('x-category-table').xtag;
    categoryTable.showCategoryEdit = false;
  }
  
  edit(category) {
    editCategory = true;
    displayCategory = false;
    this.category = category;
    
  }
  
  delete(category) {
    categories.remove(category);
    showCategoryLinks = false;
    ComposantesCommuns.sauvegarder(categories);
  }

  showLinks(category) {
    showCategoryLinks = true;
    this.category = category;
    category.links.order();
  }
  
  ajouterCategorie() {
    InputElement code = query('#add-category-code');
    InputElement description = query('#add-category-description');
    Element message = query("#add-category-message");
    var error = false;
    message.text = '';
    if (code.value.trim() == '') {
      message.text = 'category name is mandatory; ${message.text}';
      error = true;
    }
    if (!error) {
      var category = new Category();
      category.code = code.value;
      category.description = description.value;
      if (categories.add(category)) {
        message.text = 'added';
        var categoryTable = document.query('x-category-table').xtag;
        categoryTable.categories.order();
        ComposantesCommuns.sauvegarder(categories);
      } else {
        message.text = 'category name already in use';
      }
    }
  }
  
}