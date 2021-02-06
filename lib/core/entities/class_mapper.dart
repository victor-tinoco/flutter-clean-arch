abstract class ClassMapper<T> {
  T fromJson(Map<String, T> json);
  Map<String, dynamic> toJson(T model);
}
