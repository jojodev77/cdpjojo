import 'package:dju/preparation/databaseSqflite/database.dart';
import 'package:dju/preparation/team/model/team.model.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../preparation.storage.dart';

class TeamList extends StatefulWidget {
  @override
  _TeamListState createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  @override
  void initState() {
    var apiProvider = TeamApiProvider();
    apiProvider.getAllTeam();
    getMoneyPrefs();
    // getTeamSavePrefs();
    super.initState();

    // Additional initialization of the State
  }

  SharedPrefMoney sharedPrefMoney = SharedPrefMoney();
  var money;
  Team team = Team();
  Team user;
  getMoneyPrefs() async {
    sharedPrefMoney.getGestionOfMoney().then((value) {
      setState(() {
        this.money = value;
      });
    });
  }

  ListeTeam _team;
  bool _loaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'CASA DE PAPEL: L\'équipe',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.8),
          ),
        ),
      ),
      backgroundColor: Colors.red,
      body: Padding(
        child: FutureBuilder<List<Team>>(
          future: DBProvider.db.getAllTeam(),
          // fetchPosts(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? TeamListView(
                    teams: snapshot.data,
                    money: this.money.toString(),
                    teamSave: team
                    )
                : Center(child: CircularProgressIndicator());
          },
        ),
        padding: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 10.0),
      ),
    );
  }
}

class TeamListView extends StatefulWidget {
  final List<Team> teams;
  var money;
  Team team;
  Team teamSave = Team();

  final logger = Logger(
      printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
    colors: true,
    printEmojis: true,
    printTime: false,
  ));

  TeamListView({Key key, this.teams, this.money, this.teamSave})
      : super(key: key);
  @override
  TeamListViewState createState() => TeamListViewState();
}

class TeamListViewState extends State<TeamListView> {
  var money;

  SharedPrefMoney sharedPrefMoney = SharedPrefMoney();
  SharedPrefTeam sharedPrefTeam = SharedPrefTeam();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: ListView.builder(
        itemCount: widget.teams.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Budget de préparation:' + '${widget.money}' + '€'),
              Container(
                padding: EdgeInsets.all(10.0),
                constraints: BoxConstraints.expand(
                  height: 360.0,
                ),
                color: Colors.red,
                alignment: Alignment.center,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Image.network(
                          widget.teams[index].image,
                          fit: BoxFit.fitWidth,
                        ),
                        title: Text(widget.teams[index].name),
                        subtitle: Image.asset(
                          widget.teams[index].image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      ),
                      Text('${widget.teams[index].price}' + '€'),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                              'Gestion des armes:' +
                                  "" +
                                  widget.teams[index].capacityWeaponFactor
                                      .toString() +
                                  '/10',
                              style: TextStyle(
                                  height:
                                      1.2, // the height between text, default is 1.0
                                  letterSpacing:
                                      1.0 // the white space between letter, default is 0.0
                                  )),
                          Text(
                              'Gestion des explosifs:' +
                                  "" +
                                  widget.teams[index].capacityExplosiveFactor
                                      .toString() +
                                  '/10',
                              style: TextStyle(
                                  height:
                                      1.2, // the height between text, default is 1.0
                                  letterSpacing:
                                      1.0 // the white space between letter, default is 0.0
                                  )),
                          Text(
                              'Gestion des otages:' +
                                  "" +
                                  widget.teams[index].capacityHostageFactor
                                      .toString() +
                                  '/10',
                              style: TextStyle(
                                  height:
                                      1.2, // the height between text, default is 1.0
                                  letterSpacing:
                                      1.0 // the white space between letter, default is 0.0
                                  )),
                          Text(
                              'Gestion de la technologie:' +
                                  "" +
                                  widget.teams[index].capacityTechnologyFactor
                                      .toString() +
                                  '/10',
                              style: TextStyle(
                                  height:
                                      1.2, // the height between text, default is 1.0
                                  letterSpacing:
                                      1.0 // the white space between letter, default is 0.0
                                  )),
                          Row(
                            children: <Widget>[
                              ButtonTheme.bar(
                                // make buttons use the appropriate styles for cards
                                child: ButtonBar(
                                  children: <Widget>[
                                    Text(
                                        'Joyeuxxx:' +
                                            "" +
                                            widget.teams[index].happyFactor
                                                .toString() +
                                            '/10',
                                        style: TextStyle(
                                            height:
                                                1.2, // the height between text, default is 1.0
                                            letterSpacing:
                                                1.0 // the white space between letter, default is 0.0
                                            )),
                                    Text('Folie:' +
                                        "" +
                                        widget.teams[index].crazyFactor
                                            .toString() +
                                        '/10'),
                                    Text('Peur:' +
                                        "" +
                                        widget.teams[index].fearFactor
                                            .toString() +
                                        '/10'),
                                        widget.teams[index].selected ==
                                              'true'?
                                    FlatButton(
                                      child:  const Text('Annuler'),
                                      onPressed: () {
                                         setState(() {
                                          DBProvider.db
                                              .updateTeam(widget.teams[index]);
                                          widget.teams[index].selected ==
                                              'false';

                                          // gestion du budget
                                          sharedPrefMoney.gestionOfMoney(
                                              int.parse('${widget.money}') +
                                                  widget.teams[index].price);
                                          widget.money =
                                              int.parse('${widget.money}') +
                                                  widget.teams[index].price;
                                          // ajout equipe

                                          widget.teams[index].selected =
                                              'false';
                                        });
                                      },
                                    ) :
                                     FlatButton(
                                      child:  const Text('Sélectionner'),
                                      onPressed: () {
                                        setState(() {
                                          DBProvider.db
                                              .updateTeam(widget.teams[index]);
                                          widget.teams[index].selected ==
                                              'true';

                                          // gestion du budget
                                          sharedPrefMoney.gestionOfMoney(
                                              int.parse('${widget.money}') -
                                                  widget.teams[index].price);
                                          widget.money =
                                              int.parse('${widget.money}') -
                                                  widget.teams[index].price;
                                          // ajout equipe

                                          widget.teams[index].selected =
                                              'true';
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
