class PokemonModel {
  List<Pokemon>? pokemon;

  PokemonModel.fromJson({required Map<String, dynamic> json}) {
    print("*************goooooooooooooo*************");
    if (json['pokemon'] != null) {
      pokemon = <Pokemon>[];
      int index = 20;
      json['pokemon'].forEach((v) {
        if (index != 0) {
          pokemon!.add(Pokemon.fromJson(v));
          --index;
        }
      });
    }
  }
}

class Pokemon {
  int? id;
  String? num;
  String? name;
  String? img;
  List<dynamic>? type;
  String? height;
  String? weight;
  String? candy;
  int? candyCount;
  String? egg;
  dynamic spawnChance;
  dynamic avgSpawns;
  String? spawnTime;
  List<dynamic>? multipliers;
  List<String>? weaknesses;
  List<NextEvolution>? nextEvolution;
  //List<PrevEvolution>? prevEvolution;

  Pokemon({
    this.id,
    this.num,
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.candy,
    this.candyCount,
    this.egg,
    this.spawnChance,
    this.avgSpawns,
    this.spawnTime,
    this.multipliers,
    this.weaknesses,
    this.nextEvolution,
    //this.prevEvolution
  });

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    
    num = json['num'];
    name = json['name'];
    img = json['img'];
    type = json['type'];
    height = json['height'];
    weight = json['weight'];
    candy = json['candy'];
    candyCount = json['candy_count'];
    egg = json['egg'];
    spawnChance = json['spawn_chance'];
    avgSpawns = json['avg_spawns'];
    spawnTime = json['spawn_time'];
    multipliers = json['multipliers'];
    weaknesses = json['weaknesses'].cast<String>();

    if (json['next_evolution'] != null) {
      nextEvolution = <NextEvolution>[];
      json['next_evolution'].forEach((v) {
        nextEvolution!.add(new NextEvolution.fromJson(v));
      });
    }

    // if (json['prev_evolution'] != null) {
    //   prevEvolution = <PrevEvolution>[];
    //   json['prev_evolution'].forEach((v) {
    //     prevEvolution!.add(new PrevEvolution.fromJson(v));
    //   });
    // }
  }
}

class NextEvolution {
  String? num;
  String? name;

  NextEvolution({this.num, this.name});

  NextEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num'] = this.num;
    data['name'] = this.name;
    return data;
  }
}
