abstract class Parser<T> {
  const Parser();
  T parse(Map<String, dynamic> document);
}
