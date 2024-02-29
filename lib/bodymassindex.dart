import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class BodyMassIndex extends StatefulWidget {
  @override
  const BodyMassIndex({super.key});

  @override
  State<BodyMassIndex> createState() => _BodyMassIndex();
}

class _BodyMassIndex extends State<BodyMassIndex> {
  var _bodyMass = TextEditingController();
  var _bodyHeightInches = TextEditingController();
  var _bodyHeightFt = TextEditingController();

  var _calculated_value = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.tealAccent,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 8, bottom: 8),
          decoration: BoxDecoration(
              // backgroundBlendMode: BlendMode.derence,
              color: Color.fromARGB(255, 243, 243, 251),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 11,
                )
              ]),
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "BMI",
                style: TextStyle(
                  // fontFamily: "Sans",
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  textAlign: TextAlign.center,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  controller: _bodyMass,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.insert_emoticon_sharp),
                    label: Text(
                      "Enter Your Body Mass(in Kg)",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  keyboardAppearance: Brightness.light,
                  controller: _bodyHeightFt,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.height),
                    label: Text(
                      "Enter Your Height(in Foot)",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _bodyHeightInches,
                  textInputAction: TextInputAction.go,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.height_rounded),
                    label: Text(
                      "Enter Your Height (In Inches)",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 15,
                  shadowColor: const Color.fromARGB(255, 10, 4, 4),
                ),
                onPressed: () {
                  var weight = _bodyMass.text.toString();
                  var inchHeight = _bodyHeightInches.text.toString();
                  var ftHeight = _bodyHeightFt.text.toString();
                  if (weight != "" && inchHeight != "" && ftHeight != "") {
                    setState(() {
                      int intWt = int.parse(weight);
                      int intInHeight = int.parse(inchHeight);
                      int intFtHeight = int.parse(ftHeight);

                      var heightInCm = intInHeight * 2.54 + intFtHeight * 30.48;
                      var heightInM = heightInCm / 100;
                      var bmi = intWt / (heightInM * heightInM);
                      _calculated_value =
                          "Your BMI is ${bmi.toStringAsFixed(4)}";
                    });
                  } else {
                    setState(() {
                      _calculated_value = "Please Provide value to all inputs!";
                    });
                  }
                },
                child: Text(
                  "Calculate",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Text(
                _calculated_value,
                style: TextStyle(letterSpacing: 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
