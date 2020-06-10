import 'package:dju/preparation/preparationAcuueil.dart';
import 'package:flutter/material.dart';

class AccueilIntroduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'CASA DE PAPEL: Le jeu',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
        ),
        backgroundColor: Colors.red,
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Text(
                  '',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/team/professor.jpg'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Text(
                  '',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              RaisedButton(
                child: Text(
                  'Nouvelle Partie',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
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
              Text(
                'Reprendre Partie',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ],
          ),
        ));
  }
}
