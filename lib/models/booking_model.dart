class BookingModel{
  late int id;
  late String from;
  late String to;
  late String cost;
  late bool isSeat;
  late String dateTime;

  BookingModel({required this.from,required this.to,required this.cost,required this.isSeat,required this.dateTime,required this.id});
}