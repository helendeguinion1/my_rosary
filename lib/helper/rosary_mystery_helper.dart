List<String> mysteryToday(String weekdaysName) {
  String _mysteryName = '';
  String _desc = '';

  switch (weekdaysName) {
    case 'Monday':
    case 'Saturday':
      _mysteryName = "The Joyful Mystery";
      _desc =
          "By meditating on the Joyful Mysteries of the Rosary, we accompany Mary and Joseph as they learn that Mary will bring the Son of God into the world, and we journey with them through Christ's birth and into his childhood.";
      break;
    case 'Tuesday':
    case 'Friday':
      _mysteryName = "The Sorrowful Mystery";
      _desc =
          "The Sorrowful Mysteries of the Rosary are the second of the three traditional sets of events in the life of Christ upon which Catholics meditate while praying the rosary. The Sorrowful Mysteries cover the events of Holy Thursday, after the Last Supper, through the Crucifixion of Christ on Good Friday.";
      break;
    case 'Wednesday':
    case 'Sunday':
      _mysteryName = "The Glorious Mystery";
      _desc =
          "The Glorious Mysteries are the crown of Jesus' triumphs. How exhilarating to know that Jesus is God and that He rose from the dead thereby destroying death and making you an heir to Heaven.";
      break;
    case 'Thursday':
      _mysteryName = "The Luminous Mystery";
      _desc =
          "The Luminous Mysteries of the Rosary are the stories of Jesus' public life, from his baptism to his death. Jesus, by his example, teaches us what we can do to become his disciples.";
      break;
    default:
  }
  return [_mysteryName, _desc];
}
