import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:quiver/collection.dart';

class ListNotifier<E> extends DelegatingList<E> with ChangeNotifier {
  List<E> _list;
  List<E> get list => _list;
  set list(List<E> list) {
    _list = list;
    notifyListeners();
  }

  @override
  List<E> get delegate => _list;

  ListNotifier([List<E>? list]) : _list = list ?? [];


  @override
  void sort([int compare(E a, E b)?]) {
    super.sort(compare);
    notifyListeners();
  }

  @override
  void shuffle([Random? random]) {
    super.shuffle(random);
    notifyListeners();
  }

  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    super.setRange(start, end, iterable, skipCount);
    notifyListeners();
  }

  @override
  void setAll(int index, Iterable<E> iterable) {
    super.setAll(index, iterable);
    notifyListeners();
  }

  @override
  void replaceRange(int start, int end, Iterable<E> iterable) {
    super.replaceRange(start, end, iterable);
    notifyListeners();
  }

  @override
  void removeWhere(bool test(E element)) {
    super.removeWhere(test);
    notifyListeners();
  }

  @override
  void removeRange(int start, int end) {
    super.removeRange(start, end);
    notifyListeners();
  }

  @override
  E removeLast() {
    final o = super.removeLast();
    notifyListeners();
    return o;
  }

  @override
  E removeAt(int index) {
    final o = super.removeAt(index);
    notifyListeners();
    return o;
  }

  @override
  bool remove(Object? value) {
    final o = super.remove(value);
    notifyListeners();
    return o;
  }

  @override
  void insertAll(int index, Iterable<E> iterable) {
    super.insertAll(index, iterable);
    notifyListeners();
  }

  @override
  void insert(int index, E element) {
    super.insert(index, element);
    notifyListeners();
  }

  @override
  void fillRange(int start, int end, [E? fillValue]) {
    super.fillRange(start, end, fillValue);
    notifyListeners();
  }

  @override
  void clear() {
    super.clear();
    notifyListeners();
  }

  @override
  void addAll(Iterable<E> iterable) {
    super.addAll(iterable);
    notifyListeners();
  }

  @override
  void add(E value) {
    super.add(value);
    notifyListeners();
  }

  @override
  void operator []=(int index, E value) {
    super[index] = value;
    notifyListeners();
  }
}
