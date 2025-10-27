import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/todo_item.dart';

class TodoViewModel extends ChangeNotifier {
  List<TodoItem> items = [];

  static const _storageKey = 'todo_items';
  bool _isAscending = false;

  Future<void> loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_storageKey);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      items = jsonList.map((j) => TodoItem.fromJson(j as Map<String, dynamic>)).toList();
    }
    notifyListeners();
  }

  Future<void> saveItems() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = items.map((item) => item.toJson()).toList();
    await prefs.setString(_storageKey, json.encode(jsonList));
  }

  void addItem(String title) {
    final newItem = TodoItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      createdAt: DateTime.now(),
    );
    items.insert(0, newItem);  // insere no topo
    saveItems();
    notifyListeners();
  }

  void removeItem(String id) {
    items.removeWhere((item) => item.id == id);
    saveItems();
    notifyListeners();
  }

  void toggleDone(String id) {
    final index = items.indexWhere((item) => item.id == id);
    if (index != -1) {
      items[index].isDone = !items[index].isDone;
      saveItems();
      notifyListeners();
    }
  }

  void sortByDate() {
    _isAscending = !_isAscending;

    if (_isAscending) {
      items.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    } else {
      items.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    }
    saveItems();
    notifyListeners();
  }
  bool get isAscending => _isAscending;
}
