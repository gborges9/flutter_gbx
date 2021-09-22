import 'package:gbx_auth/src/domain/entities/gbx_user.dart';
import 'package:gbx_core/gbx_core.dart';

abstract class IGbxUserSerializer<T extends GbxUser> extends ISerializer<T> {}

class GbxUserSerializer extends IGbxUserSerializer<GbxUser> {
  @override
  GbxUser fromMap(Map<String, dynamic> map) =>
      GbxUser(id: map['id'], name: map['name'], email: map['email']);

  @override
  Map<String, dynamic> toMap(GbxUser model) => {
        'id': model.id,
        'name': model.name,
        'email': model.email,
      };
}
