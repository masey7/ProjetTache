import 'dart:html';
import 'dart:json';

import 'package:dartlero/dartlero.dart';
import 'package:Gestion_des_taches/dartlero_categorie_taches.dart';

CategoryTachesModel categoryTachesModel;
Categories categories;
Personnels personnels;

bool showTache = true;
bool showPersonnels = false;

toogleTache(){
  if(showTache == true){
    showTache = false;
  }
  else{
    showTache = true;    
  }
}

tooglePersonnels(){
  if(showPersonnels == true){
    showPersonnels = false;
  }
  else{
    showPersonnels = true;    
  }
}

load() {
  
  bool modelInit = false;
  
  String jsonCategorie = window.localStorage['dartlero_categorie_taches'];
  String jsonPersonnel = window.localStorage['dartlero_personnels'];
  
  if (jsonCategorie == null) {
    categoryTachesModel.init();
    modelInit = true;
  } else {
    categories.fromJson(parse(jsonCategorie));
    if (categories.length == 0) {
      categoryTachesModel.init();
      modelInit = true;
    }
  }

  if(modelInit == false){
    
    if (jsonPersonnel == null) {
      categoryTachesModel.init();
      modelInit = true;
    } else {
      personnels.fromJson(parse(jsonPersonnel));
      if (personnels.length == 0) {
        categoryTachesModel.init();
        modelInit = true;
      }
    }
}
  
  categories.order();
}





main() {
  categoryTachesModel = new CategoryTachesModel();
  categories = categoryTachesModel.categories;
  personnels = categoryTachesModel.personnels;
  load();
}