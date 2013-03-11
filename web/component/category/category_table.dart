import 'dart:html';

import  '../compo_commun/sauvegarde.dart'  as  ComposantesCommuns;
import 'package:Gestion_des_taches/dartlero_categorie_taches.dart';
import 'package:web_ui/web_ui.dart';

class CategoryTable extends WebComponent {
  Categories categories;
  Category category;
  
  bool showCategoryTaches = false;
  bool editCategory = false;
  
  update(category) {
    InputElement description = query('#edit-category-description');
    category.description = description.value;
    var categoryTable = document.query('x-category-table').xtag;
    editCategory = false;
    this.category = null;  
    categoryTable.categories.order();
    ComposantesCommuns.sauvegarder(categories);
  }
  
  refuserChangement(category) {
    editCategory = false;
    this.category = null;
  }  
  
  edit(category) {
    this.category = category;
    editCategory = true;
  }
    
  display(category) {
    if (this.category == category) {
     
        if(editCategory == true) {
        
          return false;
        }
        else{
          return true;
        }
    }
    else{
    
     return true;
  }
  }
  
  delete(category) {
    categories.remove(category);
    showCategoryTaches = false;
    ComposantesCommuns.sauvegarder(categories);
  }

  showTaches(category) {
    showCategoryTaches = true;
    this.category = category;
    category.taches.order();
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