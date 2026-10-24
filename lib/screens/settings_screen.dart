import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required this.darkMode});

  final ValueNotifier<bool> darkMode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              'Make it yours',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'A simple preference for your little counter.',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: ValueListenableBuilder<bool>(
                valueListenable: darkMode,
                builder: (context, enabled, child) {
                  return SwitchListTile(
                    secondary: const Icon(Icons.dark_mode_outlined),
                    title: const Text('Dark mode'),
                    subtitle: const Text('Use a darker color palette'),
                    value: enabled,
                    onChanged: (value) => darkMode.value = value,
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            const ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Little Counter'),
              subtitle: Text(
                'Version 1.0.0\n'
                'Count up, count down, start fresh.\n'
                'Your count and preference reset when the app restarts.',
              ),
              isThreeLine: true,
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}
