Map<String, dynamic> mysteryToday(String weekdaysName) {
  String _mysteryName = '';
  String _desc = '';
  String imageSrc = '';

  switch (weekdaysName) {
    case 'Monday':
    case 'Saturday':
      // 1 monday 6 Saturday
      imageSrc = 'assets/images/joyful_mystery.jpg';
      _mysteryName = "The Joyful Mystery";
      _desc =
          "By meditating on the Joyful Mysteries of the Rosary, we accompany Mary and Joseph as they learn that Mary will bring the Son of God into the world, and we journey with them through Christ's birth and into his childhood.";
      break;
    case 'Tuesday':
    case 'Friday':
      // 2 Tuesday, 5 Friday
      imageSrc = 'assets/images/sorrowful_mystery.jpg';
      _mysteryName = "The Sorrowful Mystery";
      _desc =
          "The Sorrowful Mysteries of the Rosary are the second of the three traditional sets of events in the life of Christ upon which Catholics meditate while praying the rosary. The Sorrowful Mysteries cover the events of Holy Thursday, after the Last Supper, through the Crucifixion of Christ on Good Friday.";
      break;
    case 'Wednesday':
    case 'Sunday':
      // 3 Wednesday, 7 Sunday
      imageSrc = 'assets/images/glorious_mystery.jpg';
      _mysteryName = "The Glorious Mystery";
      _desc =
          "The Glorious Mysteries are the crown of Jesus' triumphs. How exhilarating to know that Jesus is God and that He rose from the dead thereby destroying death and making you an heir to Heaven.";
      break;
    case 'Thursday':
      // Thursday
      imageSrc = 'assets/images/luminous_mystery.jpg';
      _mysteryName = "The Luminous Mystery";
      _desc =
          "The Luminous Mysteries of the Rosary are the stories of Jesus' public life, from his baptism to his death. Jesus, by his example, teaches us what we can do to become his disciples.";
      break;
    default:
  }
  return {
    'name': _mysteryName,
    'description': _desc,
    'imageSrc': imageSrc,
  };
}

List<Map<String, dynamic>> todaysMysteries(String mysteryName) {
  List<Map<String, dynamic>> mysteries = [];
  switch (mysteryName) {
    case 'The Joyful Mystery':
      // 1 monday 6 Saturday
      mysteries = [
        {
          'title': 'The First Mystery: The Anunciation',
          'description': 'For the Love of Humility'
        },
        {
          'title': 'The Second Mystery: The Visitation',
          'description': 'For Charity towards my Neighbor'
        },
        {
          'title': 'The Third Mystery: The Birth of Jesus',
          'description': 'For the Spirit of Poverty'
        },
        {
          'title': 'The Fourth Mystery: The Presentation',
          'description': 'For the Virtue of Obedience'
        },
        {
          'title': 'The Fifth: Finding Jesus in the Temple',
          'description': 'For the Virtue of Piety'
        }
      ];
      break;
    case 'The Sorrowful Mystery':
      // 2 Tuesday, 5 Friday
      mysteries = [
        {
          'title': 'The First Mystery: The Agony in the Garden',
          'description': 'For the Contrition for Sin'
        },
        {
          'title': 'The Second Mystery: Scourging at the Pillar',
          'description': 'For Virtue of Purity'
        },
        {
          'title': 'The Third Mystery:  Crowning with Thorns',
          'description': 'For Moral Courage'
        },
        {
          'title': 'The Fourth Mystery: Carrying of The Cross',
          'description': 'For the Virtue of Patience'
        },
        {
          'title': 'The Fifth: The Cruxifixion',
          'description': 'For Final Perseverance'
        }
      ];
      break;
    case 'The Glorious Mystery':
      mysteries = [
        {
          'title': 'The First Mystery: The Resurrection',
          'description': 'For the Virtue of Faith'
        },
        {
          'title': 'The Second Mystery: The Ascension',
          'description': 'For the Virtue of Hope'
        },
        {
          'title': 'The Third Mystery:  Descent of the Holy Spirit',
          'description': 'For the Virtue of Love'
        },
        {
          'title': 'The Fourth Mystery: The Assumption',
          'description': 'For a Happy Death'
        },
        {
          'title': 'The Fifth: The Coronation',
          'description': 'For Eternal Salvation'
        }
      ];
      break;
    case 'The Luminous Mystery':
      // Thursday
      mysteries = [
        {
          'title': 'The First Mystery: Baptism of Jesus',
          'description': 'Submission to God\'s Will'
        },
        {
          'title': 'The Second Mystery: Wedding Feast of Cana',
          'description': 'For Devotion to Mary'
        },
        {
          'title': 'The Third Mystery:  Proclamation of the Kingdom',
          'description': 'For the Grace os Conversion'
        },
        {
          'title': 'The Fourth Mystery: The Transfiguration',
          'description': 'For Holy Fear of God'
        },
        {
          'title': 'The Fifth: Institution of the Eucharist',
          'description': 'Thanksgiving to God'
        }
      ];
      break;
    default:
  }
  return mysteries;
}
