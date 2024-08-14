import 'package:hive/hive.dart';

part 'wish_list_model.g.dart';

@HiveType(typeId: 0)
class WishListModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String details;

  WishListModel({required this.id, required this.name, required this.details});

  WishListModel copyWith({
    String? id,
    String? name,
    String? details,
  }) {
    return WishListModel(
      id: id ?? this.id,
      name: name ?? this.name,
      details: details ?? this.details,
    );
  }
}
