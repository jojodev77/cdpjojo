class MaterialPreparation {
  int id;
  int activ;
  int dangerous;
  int distance;
  String image;
  String name;
  int price;
  int quantity;
  int timing;
  String type;
  String selected;

  MaterialPreparation(
      {this.id,
      this.activ,
      this.dangerous,
      this.distance,
      this.image,
      this.name,
      this.price,
      this.quantity,
      this.timing,
      this.type,
      this.selected});

  factory MaterialPreparation.fromJson(Map<String, dynamic> json) {
    return new MaterialPreparation(
        id: json['id'],
        // activ: json['activ'],
        dangerous: json['dangerous'],
        distance: json['distance'],
        image: json['image'],
        name: json['name'],
        price: json['price'],
        quantity: json['quantity'],
        timing: json['timing'],
        type: json['type'],
        selected: json['selected']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'activ': activ,
        'dangerous': dangerous,
        'distance': distance,
        'image': image,
        'name': name,
        'price': price,
        'quantity': quantity,
        'timing': timing,
        'type': type,
        'selected': selected
      };
}

class ListeMaterialPreparation {
  final List<MaterialPreparation> material;

  ListeMaterialPreparation({
    this.material,
  });

  factory ListeMaterialPreparation.fromJson(List<dynamic> parsedJson) {
    List<MaterialPreparation> materials = new List<MaterialPreparation>();
    materials = parsedJson.map((i) => MaterialPreparation.fromJson(i)).toList();

    return new ListeMaterialPreparation(
      material: materials,
    );
  }
}
