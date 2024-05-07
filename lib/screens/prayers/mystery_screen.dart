import 'package:flutter/material.dart';
//Widget
import 'package:my_rosary/widgets/organisms/mr_scaffold.dart';
import 'package:my_rosary/widgets/atoms/mr_text.dart';
//Helper
import 'package:my_rosary/helper/rosary_mystery_helper.dart';
import 'package:my_rosary/helper/prayers_helper.dart';

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
  List<Map<String, dynamic>> mysteries = [];
  int currentMystery = 0;

  @override
  void initState() {
    setState(() {
      mysteries = todaysMysteries(widget.mystery);
    });
    super.initState();
  }

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

  List<Step> mapStepper(int step) {
    List<Step> steps = [
      Step(
        title: MrText(
          text: mysteries[currentMystery]['title'],
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        content: Container(
          alignment: Alignment.centerLeft,
          child: MrText(
            text: mysteries[currentMystery]['description'],
          ),
        ),
      ),
      Step(
        title: const MrText(
          text: 'Our Father',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        content: MrText(text: prayers['ourFather']),
      ),
      Step(
        title: const MrText(
          text: 'Hail Mary (x10)',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        content: MrText(text: prayers['hailMary']),
      ),
      Step(
        title: const MrText(
          text: 'Glory Be',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        content: MrText(text: prayers['gloryBe']),
      ),
      Step(
        title: const MrText(
          text: 'Fatima Prayer',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        content: MrText(text: prayers['ohMyJesus']),
      ),
      Step(
        title: MrText(
          text: 'Hail Holy Queen',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: step == 5 ? Colors.black : Colors.grey,
        ),
        content: MrText(text: prayers['hailHolyQueen']),
      ),
    ];

    return steps;
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
                      child: Text(
                          currentMystery == 4 && step == 5 ? 'DONE' : 'NEXT'),
                    ),
                    TextButton(
                      onPressed: dtl.onStepCancel,
                      child: currentMystery == 4 && step == 5
                          ? const SizedBox()
                          : Text(step < 1 ? '' : 'CANCEL'),
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
                // navigate to home screen once done

                if (currentMystery == 4 && step == 5) {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                } else {
                  setState(() {
                    step += 1;
                  });
                  // reset step to 0 to start new mystery
                  // increment currentMystery to get the new mystery
                  if (step == 5 && currentMystery != 4) {
                    setState(() {
                      step = 0;
                      currentMystery++;
                    });
                  }
                }
              },
              steps: mapStepper(step),
            )
          ]),
        ),
      ),
    );
  }
}
