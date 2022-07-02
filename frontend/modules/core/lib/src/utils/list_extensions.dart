extension NullElementIterableExtension<E> on Iterable<E> {
  E? get firstOrNull => isEmpty ? null : first;
  E? get lastOrNull => isEmpty ? null : last;
}
