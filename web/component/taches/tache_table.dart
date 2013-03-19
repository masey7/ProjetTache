import 'dart:html';
import 'package:Gestion_des_taches/dartlero_categorie_taches.dart';
import 'package:web_ui/web_ui.dart';
import  '../compo_commun/sauvegarde.dart'  as  ComposantesCommuns;

class TacheTable extends WebComponent {
  Categories categories;
  Category category;
  Taches taches;     //Collection de tâches
  Tache instancetache;   //Une seul tâches
  Personnels personnels;   //Liste de l'ensemble du personnel
  Tache tacheAAjouter = new Tache();
  bool personnelEdit = false;
  bool showTacheEdit = false;
  


  display(tacheTestee) {
    if (this.instancetache == tacheTestee) {
     
        if(showTacheEdit == true) {
        
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
  
  refuserChangement(tache) {
    showTacheEdit = false;
    this.instancetache = null;
    
    if (personnelEdit = true){
      var categoryTable = document.query('x-category-table').xtag;
      categories = categoryTable.loadAtAnyTime();
      
    }
    personnelEdit = false;

    
  }  
  
  update(tacheAUpdater) {
    InputElement echeance = query('#edit-tache-echeance');
    InputElement description = query('#edit-tache-description');
    Element message = query("#add-tache-message");
    
    var error = false;
    if (echeance.value == '')
    {
      message.text = 'Une échéance est obligatoire; ${message.text}';
      error = true;
    }
    
    if (!error) {
      var jour = new StringBuffer();
      jour.write(echeance.value);
      jour.write(" 00:00:00");
      tacheAUpdater.date = DateTime.parse(jour.toString());
      tacheAUpdater.description = description.value;
      
      var TacheTable = document.query('x-tache-table').xtag;
      showTacheEdit = false;
      this.instancetache = null;  
      TacheTable.personnels.order();
      message.text = '';
      ComposantesCommuns.sauvegarder(categories); 
    }
  }
   
  
  ajouterTache(tacheAAjouter) {
    InputElement code = query("#add-tache-code");
    InputElement date = query("#add-tache-echeance");
    InputElement description = query("#add-tache-description");
    Element message = query("#add-tache-message");
    var error = false;
    message.text = '';
    if (code.value.trim() == '') {
      message.text = 'Le nom de la tâche est obligatoire; ${message.text}';
      error = true;
    }
    if (date.value == '')
    {
      message.text = 'Une échéance est obligatoire; ${message.text}';
      error = true;
    }
    if (!error) {
      var tache = new Tache();
      tache.code = code.value;
      
      
      for (var personel_iterator in tacheAAjouter.listeDePersonel) {
        
        var personel = new Personnel();
        personel.code = personel_iterator.code;
        personel.departement = personel_iterator.departement;

        
        
        tache.listeDePersonel.add(personel);
      }
      
      var jour = new StringBuffer();
      jour.write(date.value);
      jour.write(" 00:00:00");
      tache.date = DateTime.parse(jour.toString());
      tache.description = description.value;
      if (taches.add(tache)) {
        message.text = 'added';
        var tacheTable = document.query('x-tache-table').xtag;
        tacheTable.taches.order();
        ComposantesCommuns.sauvegarder(categories);
      } else {
        message.text = 'Tache avec le même code déjà utilisé';
      }
    }
  }
  
  ajouter(personnel, tache){
    Element message = query("#add-tache-message");
    var error = false;
    message.text = '';
    if(tache.listeDePersonel.contains(personnel) == true){
      message.text = 'Cet utilisateur existe déjà dans la tâche; ${message.text}';
      error = true;
    };
    
    if (error != true) {
      
      tache.listeDePersonel.add(personnel);   
      personnelEdit = true;
      message.text = 'Ajoutée';
        var tacheTable = document.query('x-tache-table').xtag;
        tacheTable.taches.order();
  }    
    
    
}
  
  
  deletePersonne(personnel, tache){
    tache.listeDePersonel.remove(personnel);
//    ComposantesCommuns.sauvegarder(categories);
    personnelEdit = true;
  }
  
  edit(tache) {
    showTacheEdit = true;
    this.instancetache = tache;
  }

  delete(tache) {
    taches.remove(tache);
    ComposantesCommuns.sauvegarder(categories);
  }
}