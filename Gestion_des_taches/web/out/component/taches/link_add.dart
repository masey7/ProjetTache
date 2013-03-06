// Auto-generated from link_add.html.
// DO NOT EDIT.

library x_link_add;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'dart:html';
import 'dart:uri';
import 'package:Gestion_des_taches/dartlero_categorie_taches.dart';
import 'package:web_ui/web_ui.dart';



class LinkAdd extends WebComponent {
  /** Autogenerated from the template. */

  /** CSS class constants. */
  static Map<String, String> _css = {};

  /**
   * Shadow root for this component. We use 'var' to allow simulating shadow DOM
   * on browsers that don't support this feature.
   */
  var _root;
  autogenerated.ButtonElement __e37;
  autogenerated.InputElement __addLinkCode, __addLinkDescription, __addLinkUrl;
  autogenerated.SpanElement __addLinkMessage, __e36;
  autogenerated.Template __t;

  LinkAdd.forElement(e) : super.forElement(e);

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    _root.innerHtml = '''
        <div>
          <br>
          <span class="marker" id="__e-36"></span>
          <br>
          <label for="add-link-code">Name</label>
          <input id="add-link-code" type="text" size="32">
          <br>
          <label for="add-link-url">Web Link</label>
          <input id="add-link-url" type="text" size="96">
          <br>
          <label for="add-link-description">Description</label>
          <input id="add-link-description" type="text" size="96">
          <br>
          <button id="__e-37">Add</button>
          <span id="add-link-message"></span>
        </div>
      ''';
    __e36 = _root.query('#__e-36');
    var __binding35 = __t.contentBind(() =>  category.code , false);
    __e36.nodes.addAll([new autogenerated.Text('Link of '),
        __binding35,
        new autogenerated.Text(' category')]);
    __addLinkCode = _root.query('#add-link-code');
    __addLinkUrl = _root.query('#add-link-url');
    __addLinkDescription = _root.query('#add-link-description');
    __e37 = _root.query('#__e-37');
    __t.listen(__e37.onClick, ($event) { add(); });
    __addLinkMessage = _root.query('#add-link-message');
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e36 = __addLinkCode = __addLinkUrl = __addLinkDescription = __e37 = __addLinkMessage = null;
  }

  void composeChildren() {
    super.composeChildren();
    if (_root is! autogenerated.ShadowRoot) _root = this;
  }

  /** Original code from the component. */

  Category category;
  Links links;

  add() {
    InputElement code = query("#add-link-code");
    InputElement webLink = query("#add-link-url");
    InputElement description = query("#add-link-description");
    Element message = query("#add-link-message");
    var error = false;
    message.text = '';
    if (code.value.trim() == '') {
      message.text = 'web link name is mandatory; ${message.text}';
      error = true;
    }
    if (webLink.value.trim() == '') {
      message.text = 'web link is mandatory; ${message.text}';
      error = true;
    }
    if (!error) {
      var link = new Link();
      link.code = code.value;
      var linkString = webLink.value;
      link.url = new Uri.fromString(linkString);
      link.description = description.value;
      if (links.add(link)) {
        message.text = 'added';
        var linkTable = document.query('x-link-table').xtag;
        linkTable.links.order();
      } else {
        message.text = 'web link name already in use';
      }
    }
  }

}


//@ sourceMappingURL=link_add.dart.map