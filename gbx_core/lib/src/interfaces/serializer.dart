abstract class ISerializer<T> {
  const ISerializer();

  static const _idKey = "__id_key__";

  String getId(Map<String, dynamic> map) => map[_idKey];

  T fromMap(Map<String, dynamic> map);
  T fromMapWithId(String id, Map<String, dynamic> map) =>
      fromMap({_idKey: id, ...map});

  Map<String, dynamic> toMap(T model);

  T copy(T source) => fromMap(toMap(source));
  T copyWithId(String id, T source) => fromMapWithId(id, toMap(source));
}
