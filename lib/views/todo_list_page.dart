import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/todo_view_model.dart';
import '../widgets/todo_tile.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Adicionar item'),
        content: TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Título do item'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              final title = _controller.text.trim();
              if (title.isNotEmpty) {
                Provider.of<TodoViewModel>(context, listen: false).addItem(title);
                _controller.clear();
                Navigator.pop(context);
              }
            },
            child: const Text('Adicionar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListPlus'),
        actions: [
          IconButton(
            onPressed: () => viewModel.sortByDate(),
            icon: Icon(
              viewModel.isAscending ? Icons.arrow_upward : Icons.arrow_downward,
            ),
            tooltip: 'Ordenar por data',
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: viewModel.items.isEmpty
            ? const Center(child: Text('Nenhum item adicionado. Adicione um novo item!'))
            : ListView.separated(
                key: ValueKey(viewModel.items.length),
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: viewModel.items.length,
                separatorBuilder: (_, __) => const Divider(height: 1, thickness: 0.3),
                itemBuilder: (context, index) {
                  final item = viewModel.items[index];
                  return TodoTile(item: item);
              },
            ),
          ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        onPressed: _showAddDialog,
        icon: const Icon(Icons.add),
        label: const Text('Adicionar',
        ),
      ),
    );
  }
}
