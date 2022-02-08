import 'dart:async';

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
        children: const [
          _TextFieldWithoutDebounce(),
          SizedBox(
            height: 60,
          ),
          _TextFieldWithDebounce(),
        ],
      ),
    );
  }
}

class _TextFieldWithoutDebounce extends StatefulWidget {
  const _TextFieldWithoutDebounce({Key? key}) : super(key: key);

  @override
  __TextFieldWithoutDebounceState createState() =>
      __TextFieldWithoutDebounceState();
}

class __TextFieldWithoutDebounceState extends State<_TextFieldWithoutDebounce> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        Text(
          l10n.debounceSubtitle1,
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(hintText: l10n.debounceHintText),
          onChanged: (value) {
            setState(() {
              query = value;
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [Text('${l10n.debounceResultTitle} $query')],
        )
      ],
    );
  }
}

class _TextFieldWithDebounce extends StatefulWidget {
  const _TextFieldWithDebounce({Key? key}) : super(key: key);

  @override
  __TextFieldWithDebounceState createState() => __TextFieldWithDebounceState();
}

class __TextFieldWithDebounceState extends State<_TextFieldWithDebounce> {
  String query = '';
  Timer? _debounceTimer;
  Duration debounceDuration = const Duration(milliseconds: 500);

  void _onChangedWithDebounce(String value) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(debounceDuration, () {
      // here you can add actions with debounce
      setState(() {
        query = value;
      });
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        Text(
          l10n.debounceSubtitle2,
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(hintText: l10n.debounceHintText),
          onChanged: _onChangedWithDebounce,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [Text('${l10n.debounceResultTitle} $query')],
        )
      ],
    );
  }
}
