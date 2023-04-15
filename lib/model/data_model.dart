class DataModel{
  String brand_name;
  String brand_logo;
  String due;
  String due_info;
  int status;
  String brand_id;

  DataModel({
    required this.brand_id,
    required this.status,
      required this.brand_logo,
      required this.brand_name,
      required this.due,
      required this.due_info});
  factory DataModel.fromJson(Map<String,dynamic>json)=>DataModel(
    status: json["status"],
      brand_logo:json["brand_logo"]==null?"Random Text":json["brand_logo"],
      brand_name:json["brand_name"],
      due:json["due"].toString(),
      due_info:json["due_info"],
      brand_id: json["brand_id"].toString()
  );
}