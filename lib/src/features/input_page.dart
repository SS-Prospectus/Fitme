import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fitme/src/common widgets/reusable_card.dart';
import 'package:fitme/src/common widgets/icon_content.dart';
import 'package:fitme/src/common widgets/bottom_button.dart';
import 'package:fitme/src/constants/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:fitme/src/utils/provider/provider.dart';

class InputPage extends ConsumerStatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends ConsumerState<InputPage> {
  Color maleCardColor = kInactiveCardColour;
  Color femaleCardColor = kInactiveCardColour;
  int weight = 80;
  int age = 20;
  int neck = 50;
  int waist = 80;
  int hip = 90;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      ref.watch(genderprovider.notifier).update((state) => Gender.male);
                    },
                    colour: ref.watch(genderprovider) == Gender.male ? kActiveCardColour : kInactiveCardColour,
                    cardChild: iconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      ref.watch(genderprovider.notifier).update((state) => Gender.female);
                    },
                    colour: ref.watch(genderprovider) == Gender.female ? kActiveCardColour : kInactiveCardColour,
                    cardChild: iconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic ,
                    children: [
                      Text(ref.watch(heightprovider).toString(),
                        style: kNumberTextStyle,
                      ),
                      Text('cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color (0xFFEB1555),
                      overlayColor: Color (0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: ref.watch(heightprovider).toDouble(),
                        min: 120.0,
                        max: 220.0,
                        inactiveColor: Color (0xFF8D8E98),
                        onChanged: (double newValue){
                          ref.watch(heightprovider.notifier).update((state) => newValue.round());
                        }
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(ref.watch(weightprovider).toString(),
                        style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: (){
                                weight--;
                                ref.watch(weightprovider.notifier).update((state) => weight);
                              },
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              backgroundColor: Color(0xFF4C4F5E),
                            ),
                            SizedBox(width: 10.0,),
                            FloatingActionButton(
                              onPressed: (){
                                weight++;
                                ref.watch(weightprovider.notifier).update((state) => weight);
                              },
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              backgroundColor: Color(0xFF4C4F5E),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(ref.watch(ageprovider).toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: (){
                                age --;
                                ref.watch(ageprovider.notifier).update((state) => age);
                              },
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              backgroundColor: Color(0xFF4C4F5E),
                            ),
                            SizedBox(width: 10.0,),
                            FloatingActionButton(
                              onPressed: (){
                                age ++;
                                ref.watch(ageprovider.notifier).update((state) => age);
                              },
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              backgroundColor: Color(0xFF4C4F5E),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('NECK',
                          style: kLabelTextStyle,
                        ),
                        Text(ref.watch(neckprovider).toString(),
                          style: kNumberTextStyleSmall,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                neck--;
                                ref.watch(neckprovider.notifier).update((state) => neck);
                              },
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            GestureDetector(
                              onTap: (){
                                neck++;
                                ref.watch(neckprovider.notifier).update((state) => neck);
                              },
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WAIST',
                            style: kLabelTextStyle,
                          ),
                          Text(ref.watch(waistprovider).toString(),
                            style: kNumberTextStyleSmall,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  waist--;
                                  ref.watch(waistprovider.notifier).update((state) => waist);
                                },
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10.0,),
                              GestureDetector(
                                onTap: (){waist++;
                                ref.watch(waistprovider.notifier).update((state) => waist);
                                },
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                ),
                Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('HIP',
                            style: kLabelTextStyle,
                          ),
                          Text(ref.watch(hipprovider).toString(),
                            style: kNumberTextStyleSmall,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  hip--;
                                  ref.watch(hipprovider.notifier).update((state) => hip);
                                },
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10.0,),
                              GestureDetector(
                                onTap: (){
                                  hip++;
                                  ref.watch(hipprovider.notifier).update((state) => hip);
                                },
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
          BottomButton(
            onTap: (){
              context.goNamed(
                'result'
              );
              },
            buttonTitle: 'CALCULATE',
          )
        ],
      )
    );
  }
}




