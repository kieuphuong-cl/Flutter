
class CategoryModel {
    int? id;
    String? name;
    String? imageUrl;

    CategoryModel({this.id, this.name, this.imageUrl});

    CategoryModel.fromJson(Map<String, dynamic> json) {
        if(json["id"] is int) {
            id = json["id"];
        }
        if(json["name"] is String) {
            name = json["name"];
        }
        if(json["imageURL"] is String) {
            imageUrl = json["imageURL"];
        }
    }

    static List<CategoryModel> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => CategoryModel.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["name"] = name;
        _data["imageURL"] = imageUrl;
        return _data;
    }
}