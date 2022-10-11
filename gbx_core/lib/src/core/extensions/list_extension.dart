extension ListExtension<T> on List<T> {
  List<T> addInBetween(T item) {
    List<T> newList = [];
    forEach((element) {
      newList.add(element);
      newList.add(item);
    });
    newList.removeLast();
    return newList;
  }

  List<T> addInExtremities(T item) {
    return [item, ...this, item];
  }
}
