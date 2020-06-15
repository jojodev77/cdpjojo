class Team {
  int id;
  String name;
  String status;
  String image;
  int happyFactor;
  int fearFactor;
  int trustPlanFactor;
  int trustProfessorFactor;
  int crazyFactor;
  int capacityWeaponFactor;
  int capacityHostageFactor;
  int capacityTechnologyFactor;
  int capacityExplosiveFactor;
  String positionOfPlan;
  int price;
  String selected;

  Team(
      {
      this.id,
      this.name,
      this.capacityExplosiveFactor,
      this.capacityHostageFactor,
      this.capacityTechnologyFactor,
      this.capacityWeaponFactor,
      this.crazyFactor,
      this.fearFactor,
      this.happyFactor,
      this.image,
      this.positionOfPlan,
      this.status,
      this.trustPlanFactor,
      this.trustProfessorFactor,
      this.price,
      this.selected});

  factory Team.fromJson(Map<String, dynamic> json) {
    return new Team(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        image: json['image'],
        happyFactor: json['happyFactor'],
        fearFactor: json['fearFactor'],
        trustPlanFactor: json['trustPlanFactor'],
        trustProfessorFactor: json['trustProfessorFactor'],
        crazyFactor: json['crazyFactor'],
        capacityWeaponFactor: json['capacityWeaponFactor'],
        capacityHostageFactor: json['capacityHostageFactor'],
        capacityTechnologyFactor: json['capacityTechnologyFactor'],
        capacityExplosiveFactor: json['capacityExplosiveFactor'],
        positionOfPlan: json['positionOfPlan'],
        price: json['price'],
        selected: json['selected']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'status': status,
        'image': image,
        'happyFactor': happyFactor,
        'fearFactor': fearFactor,
        'trustPlanFactor': trustPlanFactor,
        'trustProfessorFactor': trustProfessorFactor,
        'crazyFactor': crazyFactor,
        'capacityWeaponFactor': capacityWeaponFactor,
        'capacityHostageFactor': capacityHostageFactor,
        'capacityTechnologyFactor': capacityTechnologyFactor,
        'capacityExplosiveFactor': capacityExplosiveFactor,
        'positionOfPlan': positionOfPlan,
        'price': price,
        'selected': selected
      };
}

class ListeTeam {
  final List<Team> team;

  ListeTeam({
    this.team,
  });

  factory ListeTeam.fromJson(List<dynamic> parsedJson) {
    List<Team> teams = new List<Team>();
    teams = parsedJson.map((i) => Team.fromJson(i)).toList();

    return new ListeTeam(
      team: teams,
    );
  }
}
