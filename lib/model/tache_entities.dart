part of dartlero_category_tache;

class Tache extends ConceptEntity<Tache> {
  
  String description;
  DateTime date;

  Tache newEntity() => new Tache();

  String toString() {
    return '    {\n '
           '      ${super.toString()}, \n '
           '      description: ${description}\n'
           '      date: ${date}\n'           
           '    }\n';
  }

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = super.toJson();
    
    entityMap['description'] = description;
    entityMap['date'] = date;
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    super.fromJson(entityMap);
    description = entityMap['description'];
    date = entityMap['date'];
  }

  bool get onProgramming =>
      description.contains('programming') ? true : false;

}

class Taches extends ConceptEntities<Tache> {

  Taches newEntities() => new Taches();
  Tache newEntity() => new Tache();

}

