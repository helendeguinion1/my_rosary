import 'dart:math';
import 'package:flutter/material.dart';
// values
import 'package:my_rosary/values/mr_qoute.dart';
import 'package:my_rosary/widgets/atoms/mr_text.dart';

class MrQoutesPlaceHolder extends StatelessWidget {
  const MrQoutesPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomNumberImage = random.nextInt(20);
    double containerHeight = MediaQuery.of(context).size.height * 0.934;
    int randomNumberQoutes = random.nextInt(19);
    return SizedBox(
      height: containerHeight,
      child: Stack(children: [
        Container(
          height: containerHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                qoutesImages[randomNumberImage],
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(160, 7, 7, 7),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: MrText(
                  text: qoutes[randomNumberQoutes]['q'],
                  fontSize: 38,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 255, 245, 245),
                  textAlign: TextAlign.center,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: MrText(
                  text: qoutes[randomNumberQoutes]['a'],
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                  fontStyle: FontStyle.italic,
                  textAlign: TextAlign.right,
                  color: const Color.fromARGB(255, 255, 245, 245),
                ),
              )
            ]),
          ),
        )
      ]),
    );
  }
}
