import 'dart:html';
import 'package:Gestion_des_taches/dartlero_categorie_taches.dart';
import 'package:web_ui/web_ui.dart';

class TacheTable extends WebComponent {
  Category category;
  Taches Taches;
  Tache instancetache;

  bool showTacheAdd = false;
  bool showTacheEdit = false;

  add() {
    ButtonElement addTache = query("#addTacheButton");
    if (addTache.text == 'Show Add') {
      showTacheAdd = true;
      addTache.text = 'Hide Add';
    } else {
      showTacheAdd = false;
      addTache.text = 'Show Add';
    }
  }

  edit(tache) {
    showTacheEdit = true;
    this.instancetache = tache;
  }

  delete(tache) {
    Taches.remove(tache);
  }

}