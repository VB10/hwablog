
abstract class BaseJsonModel{
  BaseJsonModel();
  BaseJsonModel.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
