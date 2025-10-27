import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/todo_view_model.dart';
import 'views/todo_list_page.dart';

void main() {
  runApp(const ListPlusApp());
}

class ListPlusApp extends StatelessWidget {
  const ListPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoViewModel()..loadItems(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ListPlus',
        theme: ThemeData(
          useMaterial3: true, 
          colorSchemeSeed: Colors.teal,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
          colorScheme: const ColorScheme.dark(
            primary:  Colors.tealAccent,
            secondary: Colors.teal,
          ),
        ),
        themeMode: ThemeMode.system,
        home: const TodoListPage(),
      ),
    );
  }
}
