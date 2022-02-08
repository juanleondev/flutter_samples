import 'package:flutter/material.dart';
import 'package:flutter_samples/l10n/l10n.dart';

class DebouncePage extends StatelessWidget {
  const DebouncePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.debouncePageTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
      ),
    );
  }
}
