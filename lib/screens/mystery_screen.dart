import 'package:flutter/material.dart';
//Widget
import 'package:my_rosary/widgets/organisms/mr_scaffold.dart';
import 'package:my_rosary/widgets/atoms/mr_text.dart';

class MysteryScreen extends StatefulWidget {
  const MysteryScreen({
    Key? key,
    required this.mystery,
  }) : super(key: key);

  final String mystery;

  @override
  State<MysteryScreen> createState() => _MysteryScreenState();
}

class _MysteryScreenState extends State<MysteryScreen> {
  int step = 0;
  bool hideContinueBtn = false;
  bool hideCancelBtn = false;

  Step steper(String title, String content) {
    return Step(
      title: MrText(
        text: title,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      content: Container(
        alignment: Alignment.centerLeft,
        child: MrText(text: content),
      ),
    );
  }

  List<Step> mapStepper() {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return MrScaffold(
      appBarTitle: MrText(
        text: widget.mystery,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const MrText(
                  text: 'Autoplay',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      //show info dialog
                    },
                    icon: const Icon(
                      Icons.question_mark_rounded,
                      color: Colors.pink,
                      size: 24,
                    ))
              ],
            ),
            Stepper(
              controlsBuilder: (BuildContext ctx, ControlsDetails dtl) {
                return Row(
                  children: <Widget>[
                    TextButton(
                      onPressed: dtl.onStepContinue,
                      child: const Text('NEXT'),
                    ),
                    TextButton(
                      onPressed: dtl.onStepCancel,
                      child: Text(step < 1 ? '' : 'CANCEL'),
                    ),
                  ],
                );
              },
              currentStep: step,
              onStepCancel: () {
                if (step > 0) {
                  setState(() {
                    step -= 1;
                  });
                }
              },
              onStepContinue: () {
                setState(() {
                  step += 1;
                });
              },
              onStepTapped: (int index) {
                setState(() {
                  step = index;
                });
              },
              steps: <Step>[
                Step(
                  title: const Text('First Mystery'),
                  content: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text('Content for Step 1'),
                  ),
                ),
                const Step(
                  title: Text('Our Father'),
                  content: Text('Content for Step 2'),
                ),
                const Step(
                  title: Text('Hail Mary (x10)'),
                  content: Text('Content for Step 2'),
                ),
                const Step(
                  title: Text('Glory Be'),
                  content: Text('Content for Step 2'),
                ),
                const Step(
                  title: Text('Our Lady of Fatima Prayers'),
                  content: Text('Content for Step 2'),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
