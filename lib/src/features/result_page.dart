import 'package:fitme/src/features/bmi/data/bmi_repo.dart';
import 'package:fitme/src/utils/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:fitme/src/constants/constants.dart';
import 'package:fitme/src/common widgets/reusable_card.dart';
import 'package:fitme/src/common widgets/bottom_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fitme/src/features/bmi/presentation/bmi_controller.dart';
import 'package:fitme/src/common widgets/async_value_widget.dart';
import 'package:fitme/src/common widgets/nothing_to_show.dart';
import '../../src/utils/generic/async_value_ui.dart';

class ResultPage extends ConsumerStatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends ConsumerState<ResultPage> {
  String? bmiResult;
  String? resultText;
  String? interpretation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.watch(bmiControllerProvider.notifier).getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      bmiControllerProvider,
          (_, state) => state.showAlertDialogOnError(context),
    );

    final Bmi = ref.watch(BmiStreamProvider).value;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('Your Result',
              style: kTitleTextStyle,
            ),
          )
          ),
          Expanded(
            flex: 4,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: AsyncValueWidget(
                  value: ref.watch(bmiControllerProvider),
                  data: (_) {
                    if (Bmi == null) {
                      return const CircularProgressIndicator();
                    } else if (Bmi.data == {}) {
                      return const NothingToShow();
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Your BMI is : ",
                              style: kBodyTextStyle,
                              textAlign: TextAlign.center,
                            ),
                            Text(Bmi.data.bmi.toString(),
                              style: kResultTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Ideal BMI range is : ",
                              style: kBodyTextStyle,
                              textAlign: TextAlign.center,
                            ),
                            Text(Bmi.data.healthyBmiRange,
                              style: kResultTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Your health is ",
                              style: kBodyTextStyle,
                              textAlign: TextAlign.center,
                            ),
                            Text(Bmi.data.health.toString(),
                              style: kBodyTextStyle,
                            ),
                          ],
                        ),
                      ],
                    );
                  }
              )
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Your Body fat percentage is : ",
                          style: kBodyTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        Text(ref.watch(fatPercentageProvider).toString(),
                          style: kResultTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Your fitness level is : ",
                          style: kBodyTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        Text(ref.watch(fatlevelProvider).toString(),
                          style: kResultTextStyle,
                        ),
                      ],
                    ),
                  ],
                )
            ),
          ),
          Expanded(
            flex: 1,
            child: ReusableCard(colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Ideal body mass for you is : ",
                          style: kBodyTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        Text(ref.watch(idelamassprovider).toString(),
                          style: kResultTextStyle,
                        ),
                      ],
                    ),
                  ],
                )
            ),
          ),
          BottomButton(
              onTap: (){context.go('/');},
              buttonTitle: 'RE-CALCULATE'
          ),
        ],
      ),
    );
  }
}
