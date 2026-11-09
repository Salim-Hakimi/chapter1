import 'package:flutter/material.dart';

void main() {
  runApp(const LifecycleLabApp());
}

class LifecycleLabApp extends StatelessWidget {
  const LifecycleLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chapter 1 - StatefulWidget Lifecycle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2457C5)),
        useMaterial3: true,
      ),
      home: const LifecycleHomePage(),
    );
  }
}

class LifecycleHomePage extends StatefulWidget {
  const LifecycleHomePage({super.key});

  @override
  State<LifecycleHomePage> createState() => _LifecycleHomePageState();
}

class _LifecycleHomePageState extends State<LifecycleHomePage> {
  bool _showDemoWidget = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chapter 1: Widget Lifecycle'),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const Text(
                'StatefulWidget Lifecycle Demo',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Use the buttons to rebuild, remove, restore, and navigate away '
                'from a StatefulWidget. Watch the Run console for lifecycle logs.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
              if (_showDemoWidget)
                const LifecycleDemoWidget(key: ValueKey('lifecycle-demo'))
              else
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'The demo widget has been removed. Its dispose() method '
                      'should appear in the console.',
                    ),
                  ),
                ),
              const SizedBox(height: 12),
              FilledButton.tonalIcon(
                key: const ValueKey('toggle-demo-button'),
                onPressed: () {
                  setState(() {
                    _showDemoWidget = !_showDemoWidget;
                  });
                },
                icon: Icon(_showDemoWidget ? Icons.remove_circle_outline : Icons.add_circle_outline),
                label: Text(_showDemoWidget ? 'Remove demo widget' : 'Show demo widget again'),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                key: const ValueKey('navigate-button'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const LifecycleDetailsPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.open_in_new),
                label: const Text('Navigate to another page'),
              ),
              const SizedBox(height: 20),
              const _ConsoleHint(),
            ],
          ),
        ),
      ),
    );
  }
}

class LifecycleDemoWidget extends StatefulWidget {
  const LifecycleDemoWidget({super.key});

  @override
  State<LifecycleDemoWidget> createState() => _LifecycleDemoWidgetState();
}

class _LifecycleDemoWidgetState extends State<LifecycleDemoWidget> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    print('LifecycleDemoWidget -> initState()');
  }

  @override
  Widget build(BuildContext context) {
    print('LifecycleDemoWidget -> build()');

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Counter widget',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text('Counter value: $_counter', style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 14),
            FilledButton.icon(
              key: const ValueKey('increment-button'),
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              icon: const Icon(Icons.add),
              label: const Text('Increase counter (setState)'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    print('LifecycleDemoWidget -> dispose()');
    super.dispose();
  }
}

class LifecycleDetailsPage extends StatefulWidget {
  const LifecycleDetailsPage({super.key});

  @override
  State<LifecycleDetailsPage> createState() => _LifecycleDetailsPageState();
}

class _LifecycleDetailsPageState extends State<LifecycleDetailsPage> {
  @override
  void initState() {
    super.initState();
    print('LifecycleDetailsPage -> initState()');
  }

  @override
  Widget build(BuildContext context) {
    print('LifecycleDetailsPage -> build()');

    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.layers_outlined, size: 56),
              const SizedBox(height: 16),
              const Text(
                'This is another StatefulWidget page.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'Press Back to remove this route and observe dispose() in the console.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Go back'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    print('LifecycleDetailsPage -> dispose()');
    super.dispose();
  }
}

class _ConsoleHint extends StatelessWidget {
  const _ConsoleHint();

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.terminal),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Open the Debug Console / terminal where Flutter is running. '
                'You will see initState(), build(), and dispose() messages there.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
