import 'package:flutter/material.dart';
import '../models/todo_item.dart';
import 'package:provider/provider.dart';
import '../viewmodels/todo_view_model.dart';

class TodoTile extends StatelessWidget {
  final TodoItem item;
  const TodoTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: IconButton(
          icon: Icon(
            item.isDone ? Icons.check_circle : Icons.radio_button_unchecked,
            color: item.isDone
                ? theme.colorScheme.primary
                : theme.colorScheme.outline,
          ),
          onPressed: () {
            Provider.of<TodoViewModel>(context, listen: false)
                .toggleDone(item.id);
          },
        ),
      title: Text(
        item.title,
        style: TextStyle(
          fontSize:16,
          fontWeight: FontWeight.w500,
          decoration: 
              item.isDone ? TextDecoration.lineThrough : TextDecoration.none,
            color: item.isDone
                ? theme.colorScheme.outline
                : theme.colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        'Criado em: ${item.createdAt.toLocal().toString().split(' ')[0]}',
        style: const TextStyle(fontSize: 12),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          Provider.of<TodoViewModel>(context, listen: false).removeItem(item.id);
          },
        ),
      ),
    );
  }
}
