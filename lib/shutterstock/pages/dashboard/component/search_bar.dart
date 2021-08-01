import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shutterstock/l10n/l10n.dart';

import '../dashboard.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Theme.of(context).colorScheme.primary)
      ),
      child: TextField(
        controller: controller,
        onSubmitted: (value) {
          context.read<DashboardBloc>().add(SearchImage(query: value));
        },
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.only(top: 14, left: 8),
          hintText: context.l10n.searchHereHint,
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            onPressed: () {
              context.read<DashboardBloc>().add(
                SearchImage(query: controller.text),
              );
            },
          ),
        ),
      ),
    );
  }
}
