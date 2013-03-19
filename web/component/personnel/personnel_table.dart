import 'dart:html';
import 'dart:json';

import  '../compo_commun/sauvegarde.dart'  as  ComposantesCommuns;
import 'package:Gestion_des_taches/dartlero_categorie_taches.dart';
import 'package:web_ui/web_ui.dart';

class PersonnelTable extends WebComponent {
  Personnels personnels;
  Personnel personnel;
  Categories categories;
  
  bool editPersonnel = false;
  
  update(personnel) {
    InputElement departement = query('#edit-personnel-departement');
    personnel.departement = departement.value;
    var PersonnelTable = document.query('x-personnel-table').xtag;
    editPersonnel = false;
    this.personnel = null;  
    PersonnelTable.personnels.order();
    ComposantesCommuns.sauvegarderPersonnel(personnels);
  }
  
  refuserChangement(personnel) {
    editPersonnel = false;
    this.personnel = null;
  }  
  
  edit(personnel) {
    this.personnel = personnel;
    editPersonnel = true;
  }
    
  display(personnel) {
    if (this.personnel == personnel) {
     
        if(editPersonnel == true) {
        
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
  
  delete(personnel) {
    personnels.remove(personnel);
    editPersonnel = false;

    for (category in categories){
      for (tache in category.taches){
        if (tache.listeDePersonel.contains(personnel) == true){
        
          tache.listeDePersonel.remove(personnel);
        
        }
      }
    }
    
    ComposantesCommuns.sauvegarderPersonnel(personnels);
    ComposantesCommuns.sauvegarder(categories);
  }
  
  ajouterPersonnel() {
    InputElement code = query('#add-personnel-code');
    InputElement departement = query('#add-personnel-departement');
    Element message = query("#add-personnel-message");
    var error = false;
    message.text = '';
    if (code.value.trim() == '') {
      message.text = 'Le nom du personel est obligatoire; ${message.text}';
      error = true;
    }
    if (!error) {
      var personnel = new Personnel();
      personnel.code = code.value;
      personnel.departement = departement.value;
      if (personnels.add(personnel)) {
        message.text = 'ajouté';
        var personnelTable = document.query('x-personnel-table').xtag;
        personnelTable.personnels.order();
        ComposantesCommuns.sauvegarderPersonnel(personnels);
      } else {
        message.text = 'Le nom de cette personne est déjà utilisée est déjà utilisé.';
      }
    }
  }
  
}