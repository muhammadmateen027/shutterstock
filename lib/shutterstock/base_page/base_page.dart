import 'package:flutter/material.dart';
import '../global/global.dart';

// Write a mixin for a stateful widget to access in the app and can be used
// rather than writing again and again.
abstract class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);
}

abstract class BaseState<Page extends BasePage> extends State<Page> {}

// A mixin that will be shared in different page
mixin BasicPage<Page extends BasePage> on BaseState<Page> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: theme.colorScheme.onBackground,
        appBar: appBar(context),
        body: body(context),
      ),
    ).addSafeArea(backgroundColor: theme.colorScheme.primary);
  }

  // Add body of the screen
  Widget body(BuildContext context);

  PreferredSizeWidget appBar(BuildContext context);
}
