import 'package:dju/preparation/buildPlan/typeAction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class BuildPlan extends StatefulWidget {
  @override
  _BuildPlanState createState() => _BuildPlanState();
}

class _BuildPlanState extends State<BuildPlan> {
final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  String newTypeActionValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
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
             FormBuilder(
      key: _fbKey,
      initialValue: {
        'date': DateTime.now(),
        'accept_terms': false,
      },
      autovalidate: true,
      child: Column(
        children: <Widget>[
           FormBuilderDropdown(
            attribute: "gender",
            decoration: InputDecoration(labelText: "Type d\'action"),
            // initialValue: 'Male',
            hint: Text('Type d\'action'),
            validators: [FormBuilderValidators.required()],
            items: ListAction
              .map((gender) => DropdownMenuItem(
                 value: gender,
                 child: Text("$gender")
            )).toList(),
          ),
           FormBuilderTextField(
            attribute: "name",
            decoration: InputDecoration(labelText: "Nom du plan"),
            validators: [
              FormBuilderValidators.max(70),
              FormBuilderValidators.requiredTrue(
                errorText:
                    "You must accept terms and conditions to continue",
              ),
            ],

          ),
          // FormBuilderDateTimePicker(
          //   attribute: "date",
          //   inputType: InputType.date,
          //   format: DateFormat("yyyy-MM-dd"),
          //   decoration:
          //       InputDecoration(labelText: "Appointment Time"),
          // ),
          FormBuilderSlider(
            attribute: "slider",
            validators: [FormBuilderValidators.min(6)],
            min: 0.0,
            max: 10.0,
            initialValue: 1.0,
            divisions: 20,
            decoration:
                InputDecoration(labelText: "Number of things"),
          ),
          FormBuilderCheckbox(
            attribute: 'accept_terms',
            label: Text(
                "I have read and agree to the terms and conditions"),
            validators: [
              FormBuilderValidators.requiredTrue(
                errorText:
                    "You must accept terms and conditions to continue",
              ),
            ],
          ),
          FormBuilderDropdown(
            attribute: "gender",
            decoration: InputDecoration(labelText: "Gender"),
            // initialValue: 'Male',
            hint: Text('Select Gender'),
            validators: [FormBuilderValidators.required()],
            items: ['Male', 'Female', 'Other']
              .map((gender) => DropdownMenuItem(
                 value: gender,
                 child: Text("$gender")
            )).toList(),
          ),
         
          FormBuilderSegmentedControl(
            decoration:
                InputDecoration(labelText: "Movie Rating (Archer)"),
            attribute: "movie_rating",
            options: List.generate(5, (i) => i + 1)
                .map(
                    (number) => FormBuilderFieldOption(value: number))
                .toList(),
          ),
          FormBuilderSwitch(
            label: Text('I Accept the tems and conditions'),
            attribute: "accept_terms_switch",
            initialValue: true,
          ),
          FormBuilderTouchSpin(
            decoration: InputDecoration(labelText: "Stepper"),
            attribute: "stepper",
            initialValue: 10,
            step: 1,
          ),
          FormBuilderRate(
            decoration: InputDecoration(labelText: "Rate this form"),
            attribute: "rate",
            iconSize: 32.0,
            initialValue: 1,
            max: 5,
          ),
          FormBuilderCheckboxList(
            decoration:
            InputDecoration(labelText: "The language of my people"),
            attribute: "languages",
            initialValue: ["Dart"],
            options: [
              FormBuilderFieldOption(value: "Dart"),
              FormBuilderFieldOption(value: "Kotlin"),
              FormBuilderFieldOption(value: "Java"),
              FormBuilderFieldOption(value: "Swift"),
              FormBuilderFieldOption(value: "Objective-C"),
            ],
          ),
          FormBuilderChoiceChip(
            attribute: "favorite_ice_cream",
            options: [
              FormBuilderFieldOption(
                child: Text("Vanilla"),
                value: "vanilla"
              ),
              FormBuilderFieldOption(
                child: Text("Chocolate"),
                value: "chocolate"
              ),
              FormBuilderFieldOption(
                child: Text("Strawberry"),
                value: "strawberry"
              ),
              FormBuilderFieldOption(
                child: Text("Peach"),
                value: "peach"
              ),
            ],
          ),
          FormBuilderFilterChip(
              attribute: "pets",
              options: [
                FormBuilderFieldOption(
                  child: Text("Cats"),
                  value: "cats"
                ),
                FormBuilderFieldOption(
                  child: Text("Dogs"),
                  value: "dogs"
                ),
                FormBuilderFieldOption(
                  child: Text("Rodents"),
                  value: "rodents"
                ),
                FormBuilderFieldOption(
                  child: Text("Birds"),
                  value: "birds"
                ),
              ],
          ),
          FormBuilderSignaturePad(
            decoration: InputDecoration(labelText: "Signature"),
            attribute: "signature",
            height: 100,
          ),
        ],
      ),
    ),
    Row(
      children: <Widget>[
        MaterialButton(
          child: Text("Submit"),
          onPressed: () {
            if (_fbKey.currentState.saveAndValidate()) {
              print(_fbKey.currentState.value);
            }
          },
        ),
        MaterialButton(
          child: Text("Reset"),
          onPressed: () {
            _fbKey.currentState.reset();
          },
        ),
      ],
    )
            // TextFormField(
            //   maxLength: 55,
            //   decoration: const InputDecoration(
            //       hintText: 'Nom du plan', border: OutlineInputBorder()),
            //   validator: (value) {
            //     if (value.isEmpty) {
            //       return 'Veuillez saisir un titre';
            //     }
            //     return null;
            //   },
            // ),
            // Text('Type d\'action:'),
            // new DropdownButton<String>(
            //     items: ListAction.map((String value) {
            //       return new DropdownMenuItem<String>(
            //         value: value,
            //         child: new Text(value),
            //       );
            //     }).toList(),
            //     onChanged: (String typeActionValue) {
            //       setState(() {
            //         this.newTypeActionValue = typeActionValue;
            //       });
            //     }),
            // this.newTypeActionValue != null
            //     ? Text(this.newTypeActionValue)
            //     : Text('Aucune données saisie'),
            //     Container(
            //       child:
            //            RaisedButton(
            //     onPressed: () {
            //       final form = _formBuildPlan.currentState;
            //       if (form != null) {
            //         form.save();
            //         print(form);
            //       }
            //     },
            //     child: Text('Save')),
            //     )
       
          ],
        ));
  }
}

