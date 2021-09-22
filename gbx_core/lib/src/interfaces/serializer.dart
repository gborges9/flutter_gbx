abstract class ISerializer<T> {
  const ISerializer();

  T fromMap(Map<String, dynamic> map);

  Map<String, dynamic> toMap(T model);
}
