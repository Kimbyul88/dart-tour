enum Team {
  red,
  blue,
  black,
  white,
}

class Player {
  final String name;
  int xp;
  Team team;
  //일반적인 생성자
  Player({
    required this.name,
    required this.xp,
    required this.team,
  });
  //생성자를 초기화하는 방법1
  Player.redConstructor(String name)
      : this.name = name,
        this.team = Team.red,
        this.xp = 0;
  //생성자를 초기화하는 방법2-named 생성자
  Player.blueConstructor({required String name})
      : this.name = name,
        this.team = Team.blue,
        this.xp = 1;
  //예를들어 api를 json형태로 가져왔다고 가정
  Player.jsonAPI(Map<String, dynamic> playerjson)
      : name = playerjson["name"],
        xp = playerjson["xp"],
        team = playerjson["team"];
  void info() {
    print("$name - $xp xp - $team");
  }
}

void main() {
  var p1 = Player(
    name: "byul",
    team: Team.black,
    xp: 88,
  );
  var p_red = Player.redConstructor("dh");
  var p_blue = Player.blueConstructor(name: "nico");
  p1.info();
  p_red.info();
  p_blue.info();

  var json = [
    {
      "name": "amy",
      "team": Team.black,
      "xp": 1000,
    },
    {
      "name": "jack",
      "team": Team.blue,
      "xp": 2000,
    },
    {
      "name": "Stella",
      "team": Team.red,
      "xp": 3000,
    },
  ];
  print("-" * 6 + "JSON");
  json.forEach((playerjson) {
    var p = Player.jsonAPI(playerjson);
    p.info();
  });
  //cascade notation!!!
  print("-" * 6 + "Cascade Notation");
  var nico = Player(name: 'nico', xp: 10, team: Team.black);
  var cas = nico
    ..xp = 100
    ..team = Team.red
    ..info();
  print("original:");
  nico.info();
}
