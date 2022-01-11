class Categorie{
  int id;
  String name;
  Categorie(this.name);

  fromMap(Map<String, dynamic> data) {
    this.id = data['id'];
    this.name = data['name'];
  }
  Map<String, dynamic> toMap() => {
    'id': this.id,
    'name': this.name
  };
}