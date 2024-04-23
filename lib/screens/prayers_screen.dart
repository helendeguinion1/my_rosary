import 'package:flutter/material.dart';
import 'package:my_rosary/widgets/atoms/mr_text.dart';
import 'package:my_rosary/values/prayers.dart';
import 'package:my_rosary/widgets/organisms/mr_prayer_speech.dart';

class PrayersScreen extends StatefulWidget {
  const PrayersScreen({Key? key, required this.mysteryDay}) : super(key: key);

  final int mysteryDay;
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
    }
  }

  mysteryPrayer() {
    switch (widget.mysteryDay) {
      case 16: // SatMon Joyfull
        break;
      case 25: // Tue&Fri Sorrowful
        break;
      case 37: // Wed&Sun Glorious
        break;
      case 4: // Thurs. Luminous
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MrText(
          text: title,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
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
                    color: Colors.teal,
                  ),
                  IconButton(
                      onPressed: isPlaying
                          ? null
                          : () {
                              setState(() {
                                btnIndex++;
                              });
                              setPrayers();
                            },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: isPlaying ? Colors.grey : Colors.black,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
