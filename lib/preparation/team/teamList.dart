import 'package:dju/preparation/team/model/team.model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../preparation.storage.dart';
import 'teamList.service.dart';

class TeamList extends StatefulWidget {
  @override
  _TeamListState createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  SharedPrefMoney sharedPrefMoney = SharedPrefMoney();
  var money;
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
  void initState() {
    getMoneyPrefs();
    super.initState();

    // Additional initialization of the State
  }

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
          future: fetchPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? PhotosList(
                    photos: snapshot.data, money: this.money.toString())
                : Center(child: CircularProgressIndicator());
          },
        ),
        padding: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 10.0),
      ),
    );
  }
}

class PhotosList extends StatefulWidget {
  final List<Team> photos;
  var money;

  PhotosList({Key key, this.photos, this.money}) : super(key: key);
  @override
  PhotosListState createState() => PhotosListState();
}

class PhotosListState extends State<PhotosList> {
  var money;

  SharedPrefMoney sharedPrefMoney = SharedPrefMoney();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: ListView.builder(
        itemCount: widget.photos.length,
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
                          widget.photos[index].image,
                          fit: BoxFit.fitWidth,
                        ),
                        title: Text(widget.photos[index].name),
                        subtitle: Image.asset(
                          widget.photos[index].image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      ),
                      Text('${widget.photos[index].price}' + '€'),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                              'Gestion des armes:' +
                                  "" +
                                  widget.photos[index].capacityWeaponFactor
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
                                  widget.photos[index].capacityExplosiveFactor
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
                                  widget.photos[index].capacityHostageFactor
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
                                  widget.photos[index].capacityTechnologyFactor
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
                                        'Joyeux:' +
                                            "" +
                                            widget.photos[index].happyFactor
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
                                        widget.photos[index].crazyFactor
                                            .toString() +
                                        '/10'),
                                    Text('Peur:' +
                                        "" +
                                        widget.photos[index].fearFactor
                                            .toString() +
                                        '/10'),
                                    FlatButton(
                                      child: const Text('Sélectionner'),
                                      onPressed: () {
                                        setState(() {
                                          sharedPrefMoney.gestionOfMoney(
                                              int.parse('${widget.money}') -
                                                  widget.photos[index].price);
                                          widget.money =
                                              int.parse('${widget.money}') -
                                                  widget.photos[index].price;
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
