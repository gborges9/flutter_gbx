import 'package:farm_app/features/auth/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  UserModel(
      {required String name,
      required String email,
      required String cpf,
      required String phoneNumber,
      String? id})
      : super(
            name: name,
            cpf: cpf,
            email: email,
            phoneNumber: phoneNumber,
            id: id);

  UserModel.from(User user)
      : super(
            id: user.id,
            name: user.name,
            email: user.email,
            cpf: user.cpf,
            phoneNumber: user.phoneNumber);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
