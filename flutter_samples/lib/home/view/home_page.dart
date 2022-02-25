import 'package:flutter/material.dart';
import 'package:flutter_samples/debounce/view/debounce_page.dart';
import 'package:flutter_samples/image_generator/image_generator.dart';
import 'package:flutter_samples/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.homeAppBarTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (_) => const DebouncePage(),
                ),
              );
            },
            child: Text(l10n.homeDebounceButton),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (_) => const ImageGeneratorPage(),
                ),
              );
            },
            child: Text(l10n.homeImageGeneratorButton),
          ),
        ],
      ),
    );
  }
}
