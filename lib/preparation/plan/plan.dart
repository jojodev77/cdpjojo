import 'package:flutter/material.dart';

class Plan extends StatefulWidget {
  @override
  _PlanState createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'CASA DE PAPEL: Le plan',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.8)),
          ),
        ),
        backgroundColor: Colors.red,
        body: 
        SingleChildScrollView(
          child:Column(
           mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Plan de la fabrique de la monnaie'),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                '',
                style: TextStyle(fontSize: 22),
              ),
            ),
            Text('LEGENDE:'),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                '',
                style: TextStyle(fontSize: 22),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Text('Porte'),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Container(
                  decoration: new BoxDecoration(
                      border: new Border.all(
                          color: Colors.green,
                          width: 40.0,
                          style: BorderStyle.none),
                      image: new DecorationImage(
                        image: new AssetImage('assets/plan/porte.PNG'),
                      )),
                ),
                Text('Porte blindé'),
               
                Container(
                  decoration: new BoxDecoration(
                      border: new Border.all(
                          color: Colors.brown,
                          width: 40.0,
                          style: BorderStyle.none),
                      image: new DecorationImage(
                        image: new AssetImage('assets/plan/COFFREFORT.PNG'),
                      )),
                ),
              
                Text('Fenêtre'),
                
                Container(
                  decoration: new BoxDecoration(
                      border: new Border.all(
                          color: Colors.blueAccent,
                          width: 30.0,
                          style: BorderStyle.none),
                      image: new DecorationImage(
                        image: new AssetImage('assets/plan/fenetre.PNG'),
                      )),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                '',
                style: TextStyle(fontSize: 22),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Text('Grille aération'),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Container(
                  decoration: new BoxDecoration(
                      border: new Border.all(
                          color: Colors.blueAccent,
                          width: 30.0,
                          style: BorderStyle.none),
                      image: new DecorationImage(
                        image: new AssetImage('assets/plan/ventilations.PNG'),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Text('Grille d\'aération sécurisée'),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Container(
                  decoration: new BoxDecoration(
                      border: new Border.all(
                          color: Colors.black54,
                          width: 30.0,
                          style: BorderStyle.none),
                      image: new DecorationImage(
                        image: new AssetImage('assets/plan/ventilation.PNG'),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                
               
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Text('Caméra'),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Container(
                  decoration: new BoxDecoration(
                      border: new Border.all(
                          color: Colors.blueAccent,
                          width: 30.0,
                          style: BorderStyle.none),
                      image: new DecorationImage(
                        image: new AssetImage('assets/plan/camera.PNG'),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Text('Climatiseur'),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Container(
                  decoration: new BoxDecoration(
                      border: new Border.all(
                          color: Colors.black54,
                          width: 30.0,
                          style: BorderStyle.none),
                      image: new DecorationImage(
                        image: new AssetImage('assets/plan/clim.PNG'),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                
               
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: Text(
                '',
                style: TextStyle(fontSize: 22),
              ),
            ),
            SingleChildScrollView(
              child: 
              Column(
                 mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('TOIT'),
                  Container(
                  decoration: new BoxDecoration(
                      border: new Border.all(
                          color: Colors.lightBlueAccent,
                          width: 230.0,
                          style: BorderStyle.none),
                      image: new DecorationImage(
                        image: new AssetImage('assets/plan/toit.PNG'),
                      )),
                      
                      
                ),
                 Text('1er ETAGE'),
                  Container(
                  decoration: new BoxDecoration(
                      border: new Border.all(
                          color: Colors.lightBlueAccent,
                          width: 200.0,
                          style: BorderStyle.none),
                      image: new DecorationImage(
                        image: new AssetImage('assets/plan/etage.PNG'),
                      )),
                ),
                 Text('RDC'),
                  Container(
                  decoration: new BoxDecoration(
                      border: new Border.all(
                          color: Colors.lightBlueAccent,
                          width: 200.0,
                          style: BorderStyle.none),
                      image: new DecorationImage(
                        image: new AssetImage('assets/plan/rdc.PNG'),
                      )),
                      
                      
                ),
                 Text('SOUS-SOL'),
                  Container(
                  decoration: new BoxDecoration(
                      border: new Border.all(
                          color: Colors.lightBlueAccent,
                          width: 200.0,
                          style: BorderStyle.none),
                      image: new DecorationImage(
                        image: new AssetImage('assets/plan/SOUSSOL.PNG'),
                      )),
                      
                      
                ),
                ],
              ),
            )
          ],
        ),
        ),
        )
        ;
  }
}
