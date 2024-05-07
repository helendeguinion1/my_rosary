import 'package:flutter/material.dart';
import 'package:my_rosary/helper/date_time_helper.dart';
import 'package:my_rosary/helper/rosary_mystery_helper.dart';
import 'package:my_rosary/screens/prayers/prayers_screen.dart';
import 'package:my_rosary/widgets/atoms/mr_text.dart';
import 'package:my_rosary/widgets/molecules/mr_elevated_button.dart';

class PrayersTabScreen extends StatelessWidget {
  const PrayersTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/mama_mary.png'),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: MrText(
              text: weekdaysName(),
              color: const Color(0xff67729D),
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          MrText(
            text: mysteryToday(weekdaysName())['name'],
            color: const Color(0xff67729D),
            fontSize: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 15, top: 15.0),
            child: MrText(
              text: mysteryToday(weekdaysName())['description'],
              fontSize: 15,
              textAlign: TextAlign.center,
              color: Colors.black87,
            ),
          ),
          Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
              child: SizedBox(
                width: double.infinity,
                child: MrElevatedButton(
                  text: 'Start My Rosary',
                  textWeight: FontWeight.bold,
                  textSize: 15,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PrayersScreen(
                            dayName: weekdaysName(),
                          ))),
                ),
              ))
        ]);
  }
}
