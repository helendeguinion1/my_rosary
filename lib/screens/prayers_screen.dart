import 'package:flutter/material.dart';
import 'package:my_rosary/screens/mystery_screen.dart';
import 'package:my_rosary/widgets/atoms/mr_text.dart';
import 'package:my_rosary/values/prayers.dart';
import 'package:my_rosary/widgets/organisms/mr_prayer_speech.dart';
import 'package:my_rosary/helper/rosary_mystery_helper.dart';

class PrayersScreen extends StatefulWidget {
  const PrayersScreen({Key? key, required this.dayName}) : super(key: key);

  final String dayName;
  @override
  State<PrayersScreen> createState() => _PrayersScreenState();
}

class _PrayersScreenState extends State<PrayersScreen> {
  String prayer = '';
  String title = '';
  int btnIndex = 0;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    title = 'Apostles Creed';
    prayer = prayers['apostleCreed']!;
  }

  setPrayers() {
    switch (btnIndex) {
      case 0:
        setState(() {
          title = 'Apostles Creed';
          prayer = prayers['apostleCreed']!;
        });
        break;
      case 1:
        setState(() {
          title = 'Our Father';
          prayer = prayers['ourFather']!;
        });
        break;
      case 2:
        setState(() {
          title = 'Hail Mary (x3)';
          prayer = prayers['hailMary']!;
        });
        break;
      case 3:
        setState(() {
          title = 'Glory Be';
          prayer = prayers['gloryBe']!;
        });
        break;
      case 4:
        setState(() {
          title = mysteryToday(widget.dayName)['name'];
        });
    }
  }

  Widget mysteryPrayer() {
    Map<String, dynamic> mystery = mysteryToday(widget.dayName);

    return mysterScreen(
        mystery['name'], mystery['description'], mystery['imageSrc']);
  }

  Widget mysterScreen(String title, String description, String imageUrl) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 36),
          child: MrText(
            text: title,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width * 0.70,
                child: Image.asset(imageUrl),
              ),
              MrText(
                text: description,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const MrText(
              text: 'Proceed',
              fontStyle: FontStyle.italic,
              color: Colors.pink,
              fontSize: 12,
              fontWeight: FontWeight.w200,
            ),
            InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  // navigate to mystery screen
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MysteryScreen(
                          mystery: mysteryToday(widget.dayName)['name'])));
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  width: 60,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.pink,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.pink,
                      )
                    ],
                  ),
                ))
          ],
        )
      ],
    );
  }

  initPrayer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * .50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: MrText(
                      text: title,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
                MrText(
                  text: prayer,
                  fontSize: 16,
                ),
              ],
            )),
        const Divider(
          height: 40,
          indent: 4,
          endIndent: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, right: 16),
          child: MrPrayerSpeech(
            prayer: prayer,
            checkDonePlaying: (isDonePlaying) {
              setState(() {
                isPlaying = !isDonePlaying;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    if (btnIndex > 0) {
                      btnIndex--;
                    }
                  });
                  setPrayers();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: btnIndex <= 0 ? Colors.grey : Colors.black,
                )),
            const MrText(
              text: 'Click back or forward button to navigate prayers',
              fontStyle: FontStyle.italic,
              fontSize: 10,
              color: Colors.pink,
            ),
            IconButton(
                onPressed: isPlaying
                    ? null
                    : () {
                        if (btnIndex < 4) {
                          setState(() {
                            btnIndex++;
                          });
                        }
                        setPrayers();
                      },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color:
                      isPlaying || btnIndex == 4 ? Colors.grey : Colors.black,
                ))
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MrText(
          text: title,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: btnIndex == 4 ? mysteryPrayer() : initPrayer(),
        ),
      ),
    );
  }
}
