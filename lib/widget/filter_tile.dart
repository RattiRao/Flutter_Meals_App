import 'package:flutter/material.dart';

class FilterTile extends StatelessWidget {
  const FilterTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isValueSet,
      required this.onChanged});
  final String title;
  final String subtitle;
  final bool isValueSet;
  final Function(bool isChecked) onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: isValueSet,
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.background),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.background),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: EdgeInsets.only(left: 34, right: 22),
    );
  }
}
