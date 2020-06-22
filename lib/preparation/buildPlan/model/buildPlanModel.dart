class BuildPlan {
  int id;
  String name;
  String type;
  String condition;
  bool actived;
  int startedTiming;
  int endTiming;
  bool status;
  String actions;

  BuildPlan(
  {
  this.id,
  this.name,
  this.type,
  this.condition,
  this.actived,
  this.startedTiming,
  this.endTiming,
  this.status,
  this.actions
}
);

 factory BuildPlan.fromJson(Map<String, dynamic> json) {
return new BuildPlan(
id: json['id'],
name: json['name'],
type: json['type'],
condition: json['condition'],
actived: json['actived'],
startedTiming: json['startedTiming'],
endTiming: json['endTiming'],
status: json['status'],
actions: json['status']
);
 }

  Map<String, dynamic> toJson() => {
'id': id,
'name': name,
'type': type,
'condition': condition,
'actived': actived,
'startedTiming': startedTiming,
'endTiming': endTiming,
'status': status,
'actions': actions
  };

}

class ListeBuildPlan {
  final List<BuildPlan> buildPlan;

  ListeBuildPlan({
    this.buildPlan,
  });

  factory ListeBuildPlan.fromJson(List<dynamic> parsedJson) {
    List<BuildPlan> buildPlans = new List<BuildPlan>();
    buildPlans = parsedJson.map((i) => BuildPlan.fromJson(i)).toList();

    return new ListeBuildPlan(
      buildPlan: buildPlans,
    );
  }
}