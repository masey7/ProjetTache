// Auto-generated from categorie_taches.html.
// DO NOT EDIT.

library categorie_taches_html;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'dart:html';
import 'dart:json';
import 'package:dartlero/dartlero.dart';
import 'package:Gestion_des_taches/dartlero_categorie_taches.dart';
import 'component/category/category_table.dart';


// Original code


CategoryLinksModel categoryLinksModel;
Categories categories;

load() {
  String json = window.localStorage['dartlero_categorie_taches'];
  if (json == null) {
    categoryLinksModel.init();
  } else {
    categories.fromJson(parse(json));
    if (categories.length == 0) {
      categoryLinksModel.init();
    }
  }
  categories.order();
}

main() {
  categoryLinksModel = new CategoryLinksModel();
  categories = categoryLinksModel.categories;
  load();
}


// Additional generated code
void init_autogenerated() {
  var _root = autogenerated.document.body;
  var __e0;
  var __t = new autogenerated.Template(_root);
  __e0 = _root.query('#__e-0');
  __t.oneWayBind(() =>  categories , (e) { __e0.xtag.categories = e; }, false, false);
  __t.component(new CategoryTable.forElement(__e0));
  __t.create();
  __t.insert();
}

//@ sourceMappingURL=category_links.dart.map