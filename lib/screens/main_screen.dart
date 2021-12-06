import 'package:flutter/material.dart';
import 'package:my_rosary/widgets/molecules/mr_main_drawer.dart';
//Widgets
import 'package:my_rosary/widgets/organisms/mr_scaffold.dart';
import 'package:my_rosary/widgets/atoms/mr_text.dart';
import 'package:my_rosary/widgets/molecules/mr_elevated_button.dart';
//Helper
import 'package:my_rosary/helper/date_time_helper.dart';
import 'package:my_rosary/helper/rosary_mystery_helper.dart';
//Screens
import 'package:my_rosary/screens/start_rosary_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // String? _mysteryName;
  // String? _desc;
  // String _mysteryToday() {
  //   switch (weekdaysName()) {
  //     case 'Monday':
  //     case 'Saturday':
  //       _mysteryName = "The Joyful Mystery";
  //       _desc =
  //           "By meditating on the Joyful Mysteries of the Rosary, we accompany Mary and Joseph as they learn that Mary will bring the Son of God into the world, and we journey with them through Christ's birth and into his childhood.";
  //       break;
  //     case 'Tuesday':
  //     case 'Friday':
  //       _mysteryName = "The Sorrowful Mystery";
  //       _desc =
  //           "The Sorrowful Mysteries of the Rosary are the second of the three traditional sets of events in the life of Christ upon which Catholics meditate while praying the rosary. The Sorrowful Mysteries cover the events of Holy Thursday, after the Last Supper, through the Crucifixion of Christ on Good Friday.";
  //       break;
  //     case 'Wednesday':
  //     case 'Sunday':
  //       _mysteryName = "The Glorious Mystery";
  //       _desc =
  //           "The Glorious Mysteries are the crown of Jesus' triumphs. How exhilarating to know that Jesus is God and that He rose from the dead thereby destroying death and making you an heir to Heaven.";
  //       break;
  //     case 'Thursday':
  //       _mysteryName = "The Luminous Mystery";
  //       _desc =
  //           "The Luminous Mysteries of the Rosary are the stories of Jesus' public life, from his baptism to his death. Jesus, by his example, teaches us what we can do to become his disciples.";
  //       break;
  //     default:
  //   }
  //   return weekdaysName();
  // }

  @override
  Widget build(BuildContext context) {
    return MrScaffold(
        appBarTitle: const MrText(
          text: "My Rosary",
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        drawer: const MrMainDrawer(),
        body: Column(children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Image.asset('assets/images/main_screen_image.png')),
          const SizedBox(
            height: 30,
          ),
          MrText(
            text: weekdaysName(),
            color: Colors.green[300]!,
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
          MrText(
            text: mysteryToday(weekdaysName())[0],
            color: Colors.green[200]!,
            fontSize: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0, right: 2.0, top: 15.0),
            child: MrText(
              text: mysteryToday(weekdaysName())[1],
              fontSize: 15,
              textAlign: TextAlign.center,
              color: Colors.black87,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0),
              child: SizedBox(
                width: double.infinity,
                child: MrElevatedButton(
                  text: 'Start My Rosary',
                  textColor: Colors.white,
                  textWeight: FontWeight.bold,
                  textSize: 15,
                  onPressed: () =>
                      Navigator.pushNamed(context, '/start-rosary'),
                ),
              ))
        ]));
  }
}
