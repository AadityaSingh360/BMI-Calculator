import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'reusable_card.dart';


enum Gender{
  male,
  female
}

enum chosenButton{
  plus,
  minus
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height=180;
  int weight=60;
  int age=19;

  int selectedButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedGender=Gender.male;
                          });
                        },
                        child: ReusableCard(
                          colour: selectedGender==Gender.male?kactiveCardColor:kinactiveCardColor,
                          cardchild: IconContent(
                            icons: FontAwesomeIcons.mars,
                            text: 'MALE',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedGender=Gender.female;
                          });
                        },
                        child: ReusableCard(
                          colour: selectedGender==Gender.female?kactiveCardColor:kinactiveCardColor,
                          cardchild: IconContent(
                            icons: FontAwesomeIcons.venus,
                            text: 'FEMALE',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kactiveCardColor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: klabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                              height.toString(),
                              style: knumberTextStyle
                          ),
                          Text(
                            'cm',
                            style: klabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                            overlayColor: Color(0x29EB1555),
                            thumbColor: kbottomContainerColor
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double value){
                            setState(() {
                              height=value.round();
                            });
                          },
                          inactiveColor: Color(0xFF8D8E98),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                          colour: kactiveCardColor,
                          cardchild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'WEIGHT',
                                style: klabelTextStyle,
                              ),
                              Text(
                                weight.toString(),
                                style: knumberTextStyle,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIcon(
                                    icon: FontAwesomeIcons.minus,
                                    changeWeight: (){
                                      setState(() {
                                        weight==0?weight=0:weight--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 7.0,
                                  ),
                                  RoundIcon(
                                    icon: FontAwesomeIcons.plus,
                                    changeWeight: (){
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          )
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                          colour: kactiveCardColor,
                          cardchild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AGE',
                                style: klabelTextStyle,
                              ),
                              Text(
                                age.toString(),
                                style: knumberTextStyle,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIcon(
                                    icon: FontAwesomeIcons.minus,
                                    changeWeight: (){
                                      setState(() {
                                        age==0?age=0:age--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 7.0,
                                  ),
                                  RoundIcon(
                                    icon: FontAwesomeIcons.plus,
                                    changeWeight: (){
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          )
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  CalculatorBrain cal=CalculatorBrain(height: height, weight: weight);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>ResultPage(bmiResult: cal.calculateBMI(),resultText: cal.getResult(),interpretation: cal.getInterpretation(),)));
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'CALCULATE',
                      style: klargeTextButton,
                    ),
                  ),
                  color: kbottomContainerColor,
                  margin: EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                  height: kbottomContainerHeight,
                ),
              )
            ],
          ),
        ));
  }
}

class RoundIcon extends StatelessWidget {

  final IconData icon;
  final Function changeWeight;
  const RoundIcon({this.icon,this.changeWeight});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      shape: CircleBorder(),
      onPressed: (){
        changeWeight();
      },
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0
      ),
      elevation: 6.0,
    );
  }
}




