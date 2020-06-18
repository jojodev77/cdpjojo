import 'package:flutter/material.dart';

class BuildPlan extends StatefulWidget {
  @override
  _BuildPlanState createState() => _BuildPlanState();
}

class _BuildPlanState extends State<BuildPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'CASA DE PAPEL: Création des plans',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
        ),
        backgroundColor: Colors.red,
        body: Column(
          children: <Widget>[
            TextFormField(
              maxLength: 55,
              decoration: const InputDecoration(
                  hintText: 'Nom du plan',
                  border: OutlineInputBorder()),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Veuillez saisir un titre';
                }
                return null;
              },
            )
          ],
        ));
  }
}
