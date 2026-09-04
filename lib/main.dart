import 'package:flutter/material.dart';
import 'database.dart';

final db = AppDatabase();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Tracker',
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  Future<void> _addSubject() async {
    final name = _controller.text.trim();
    if (name.isEmpty) return;
    await db.into(db.subjects).insert(SubjectsCompanion.insert(name: name));
    _controller.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Study Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Subject name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FilledButton(onPressed: _addSubject, child: const Text('Add')),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<Subject>>(
                future: db.select(db.subjects).get(),
                builder: (context, snapshot) {
                  final subjects = snapshot.data ?? [];
                  if (subjects.isEmpty) {
                    return const Center(child: Text('No subjects yet'));
                  }
                  return ListView.builder(
                    itemCount: subjects.length,
                    itemBuilder: (context, i) => ListTile(
                      leading: const Icon(Icons.book),
                      title: Text(subjects[i].name),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
