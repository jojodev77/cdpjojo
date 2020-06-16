import 'package:flutter/material.dart';

import 'material/materialList.dart';
import 'preparation.storage.dart';
import 'team/teamList.dart';

class PreparationAccueil extends StatefulWidget {
  @override
  _PreparationAccueilState createState() => _PreparationAccueilState();
}

class _PreparationAccueilState extends State<PreparationAccueil> {
SharedPrefMoney sharedPrefMoney = SharedPrefMoney();
  	@override
	void initState(){
    sharedPrefMoney.gestionOfMoney(48000);
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
          'CASA DE PAPEL: Préparation',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.8)),
        ),
      ),
      backgroundColor: Colors.red,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                'Préparons le braquage:',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 27),
              ),
              Container(
                width: 110,
                height: 150,
                child: MaterialButton(
                  shape: CircleBorder(
                    side: BorderSide(
                        width: 2, color: Colors.red, style: BorderStyle.solid),
                  ),
                  child: Text(
                    "Voir le plan de la fabrique",
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.lightBlue,
                  textColor: Colors.black,
                  onPressed: () {},
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 20, 5),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                  Container(
                    width: 110,
                    height: 150,
                    child: MaterialButton(
                      shape: CircleBorder(
                        side: BorderSide(
                            width: 2,
                            color: Colors.red,
                            style: BorderStyle.solid),
                      ),
                      child: Text(
                        "Votre équipe",
                        textAlign: TextAlign.center,
                      ),
                      color: Colors.lightBlue,
                      textColor: Colors.black,
                       onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeamList()),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text(
                      '',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Container(
                    width: 110,
                    height: 150,
                    child: MaterialButton(
                      shape: CircleBorder(
                        side: BorderSide(
                            width: 2,
                            color: Colors.red,
                            style: BorderStyle.solid),
                      ),
                      child: Text(
                        "Votre matériel",
                        textAlign: TextAlign.center,
                      ),
                      color: Colors.lightBlue,
                      textColor: Colors.black,
                      onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MaterialPreparationList()),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text(
                      '',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Container(
                    width: 110,
                    height: 150,
                    child: MaterialButton(
                      shape: CircleBorder(
                        side: BorderSide(
                            width: 2,
                            color: Colors.red,
                            style: BorderStyle.solid),
                      ),
                      child: Text(
                        "Création des plans",
                        textAlign: TextAlign.center,
                      ),
                      color: Colors.lightBlue,
                      textColor: Colors.black,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeamList()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 100, 5),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                RaisedButton(
                  child: Text(
                    'Lancer le braquage',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PreparationAccueil()),
                    );
                  },
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
