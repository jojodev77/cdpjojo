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
                          width: 15.0,
                          style: BorderStyle.solid),
                      image: new DecorationImage(
                        image: new AssetImage('assets/team/rio.jpg'),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Text('Porte blindé'),
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
                          color: Colors.brown,
                          width: 15.0,
                          style: BorderStyle.solid),
                      image: new DecorationImage(
                        image: new AssetImage('assets/team/rio.jpg'),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Text('Fenêtre'),
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
                          width: 15.0,
                          style: BorderStyle.solid),
                      image: new DecorationImage(
                        image: new AssetImage('assets/team/rio.jpg'),
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
                Text('Fenêtre avec grille'),
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
                          width: 15.0,
                          style: BorderStyle.solid),
                      image: new DecorationImage(
                        image: new AssetImage('assets/team/rio.jpg'),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Text('Grille d\'aération'),
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
                          color: Colors.black54,
                          width: 15.0,
                          style: BorderStyle.solid),
                      image: new DecorationImage(
                        image: new AssetImage('assets/team/rio.jpg'),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
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
                          width: 15.0,
                          style: BorderStyle.solid),
                      image: new DecorationImage(
                        image: new AssetImage('assets/team/rio.jpg'),
                      )),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 40, 0),
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
                          width: 200.0,
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
