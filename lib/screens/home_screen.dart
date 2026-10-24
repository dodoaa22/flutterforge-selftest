import 'package:flutter/material.dart';

import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.darkMode});

  final ValueNotifier<bool> darkMode;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _count = 0;

  void _changeCount(int amount) {
    setState(() => _count += amount);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Little Counter'),
        actions: [
          IconButton(
            tooltip: 'Settings',
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) =>
                      SettingsScreen(darkMode: widget.darkMode),
                ),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight > 48
                      ? constraints.maxHeight - 48
                      : 0,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.touch_app_outlined,
                          size: 40,
                          color: colors.primary,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Make every tap count.',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'A little space for keeping track.',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Card(
                          elevation: 0,
                          color: colors.primaryContainer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(32),
                              child: Column(
                                children: [
                                  Text(
                                    'CURRENT COUNT',
                                    style: theme.textTheme.labelLarge?.copyWith(
                                      color: colors.onPrimaryContainer,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Semantics(
                                    liveRegion: true,
                                    label: 'Current count: $_count',
                                    child: ExcludeSemantics(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          '$_count',
                                          style: theme.textTheme.displayLarge
                                              ?.copyWith(
                                            fontSize: 88,
                                            fontWeight: FontWeight.w600,
                                            color: colors.onPrimaryContainer,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () => _changeCount(-1),
                                style: OutlinedButton.styleFrom(
                                  minimumSize: const Size(0, 64),
                                ),
                                child: const Semantics(
                                  label: 'Decrease count',
                                  child: ExcludeSemantics(
                                    child: Icon(Icons.remove),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              flex: 2,
                              child: FilledButton.icon(
                                onPressed: () => _changeCount(1),
                                style: FilledButton.styleFrom(
                                  minimumSize: const Size(0, 64),
                                ),
                                icon: const Icon(Icons.add),
                                label: const Text('Add one'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextButton.icon(
                          onPressed: _count == 0
                              ? null
                              : () => setState(() => _count = 0),
                          icon: const Icon(Icons.restart_alt),
                          label: const Text('Reset counter'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
