import 'package:dju/preparation/databaseSqflite/database.dart';
import 'package:dju/preparation/material/model/material.model.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../preparation.storage.dart';


class MaterialPreparationList extends StatefulWidget {
  @override
  _MaterialPreparationListState createState() => _MaterialPreparationListState();
}

class _MaterialPreparationListState extends State<MaterialPreparationList> {
  @override
  void initState() {
    var apiProvider = MaterialApiProvider();
    apiProvider.getAllMaterial();
    getMoneyPrefs();
    // getTeamSavePrefs();
    super.initState();

    // Additional initialization of the State
  }

  SharedPrefMoney sharedPrefMoney = SharedPrefMoney();
  var money;
  MaterialPreparation material = MaterialPreparation();
  MaterialPreparation user;
  getMoneyPrefs() async {
    sharedPrefMoney.getGestionOfMoney().then((value) {
      setState(() {
        this.money = value;
      });
    });
  }

  ListeMaterialPreparation _Material;
  bool _loaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'CASA DE PAPEL: Le matériel',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.8),
          ),
        ),
      ),
      backgroundColor: Colors.red,
      body: Padding(
        child: FutureBuilder<List<MaterialPreparation>>(
          future: DBProviderMaterial.db.getAllMaterial(),
          // fetchPosts(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? MaterialPreparationListView(
                    materials: snapshot.data,
                    money: this.money.toString()
                    )
                : Center(child: CircularProgressIndicator());
          },
        ),
        padding: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 10.0),
      ),
    );
  }
}

class MaterialPreparationListView extends StatefulWidget {
  final List<MaterialPreparation> materials;
  var money;
  Material material;
  Material materialSave = Material();

  final logger = Logger(
      printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
    colors: true,
    printEmojis: true,
    printTime: false,
  ));

 MaterialPreparationListView({Key key, this.materials, this.money, this.materialSave})
      : super(key: key);
  @override
 MaterialPreparationListViewState createState() => MaterialPreparationListViewState();
}

class MaterialPreparationListViewState extends State<MaterialPreparationListView> {
  var money;

  SharedPrefMoney sharedPrefMoney = SharedPrefMoney();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: ListView.builder(
        itemCount: widget.materials.length,
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
                          widget.materials[index].image,
                          fit: BoxFit.fitWidth,
                        ),
                        title: Text(widget.materials[index].name),
                        subtitle: Image.asset(
                          widget.materials[index].image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      ),
                      Text('${widget.materials[index].price}' + '€'),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                              'Type d\'utilisation:' +
                                  "" +
                                  widget.materials[index].type
                                      .toString(),
                              style: TextStyle(
                                  height:
                                      1.2, // the height between text, default is 1.0
                                  letterSpacing:
                                      1.0 // the white space between letter, default is 0.0
                                  )),
                          Text(
                              'Quzntité:' +
                                  "" +
                                  widget.materials[index].quantity
                                      .toString(),
                              style: TextStyle(
                                  height:
                                      1.2, // the height between text, default is 1.0
                                  letterSpacing:
                                      1.0 // the white space between letter, default is 0.0
                                  )),
                          Text(
                              'Nombre d\'utilisation:' +
                                  "" +
                                  widget.materials[index].timing
                                      .toString(),
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
                              
                                        widget.materials[index].selected ==
                                              'true'?
                                    FlatButton(
                                      child:  const Text('Annuler'),
                                      onPressed: () {
                                         setState(() {
                                          DBProviderMaterial.db
                                              .updateMaterial(widget.materials[index]);
                                          widget.materials[index].selected ==
                                              'false';

                                          // gestion du budget
                                          sharedPrefMoney.gestionOfMoney(
                                              int.parse('${widget.money}') +
                                                  widget.materials[index].price);
                                          widget.money =
                                              int.parse('${widget.money}') +
                                                  widget.materials[index].price;
                                          // ajout equipe

                                          widget.materials[index].selected =
                                              'false';
                                        });
                                      },
                                    ) :
                                     FlatButton(
                                      child:  const Text('Sélectionner'),
                                      onPressed: () {
                                        setState(() {
                                          DBProviderMaterial.db
                                              .updateMaterial(widget.materials[index]);
                                          widget.materials[index].selected =
                                              'true';

                                          // gestion du budget
                                          sharedPrefMoney.gestionOfMoney(
                                              int.parse('${widget.money}') -
                                                  widget.materials[index].price);
                                          widget.money =
                                              int.parse('${widget.money}') -
                                                  widget.materials[index].price;
                                          // ajout equipe

                                          widget.materials[index].selected =
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
