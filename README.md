# Shutterstock

![coverage][flutter_version]
![coverage][dart_version]
![coverage][bloc_version]
![coverage][override_bloc_version]
![coverage][sentry_io]
![coverage][dio]
![coverage][development] ![coverage][staging] ![coverage][production]
![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]


---

# Getting Started 🚀

In this project we will discuss:

- ✅ [Problem](#problem)
- ✅ [Solution](#solution)
- ✅ [Flavours](#flavours-)
- ✅ [Translation](#working-with-translations-)
- ✅ [Dependencies](#dependencies)
- 🔲  [Tests](#tests-)
---
## Problem 💥

Develop an application that load images from the internet. Images should be shown in an infinite scroll without lagging.
For this project you are required to use http://api.shutterstock.com to create api-key.
---
## Solution 💪
Solution's designed in that way, so a user can access the images and can see in the list.
We will discuss how it's designed and where the files're placed.

- `lib` will contains view(pages, widgets, components), BLoC, configuration, etc.
- `packages` will keep network and repository layer.

**Let's discuss the implementation layer by layer**
- `Pages` section will have UI of the application and business logic layer and BLoC placed with respective UI/view
- We have used [flutter_bloc](https://bloclibrary.dev/) as a state management library and Business logic's implemented
in `DashboardBloc` because we have only one (1) page and we created one (1)bloc.
- `DashboardBloc` communicates with `RepositoryService` interface.
- `RepositoryService` implements the function in a `Repository` where we are reading `url` and `access token` from
  `.env` file.
- A `NetworkClient` injected in `Repository` so api can be called while passing reading all the respective parameters.
- The `NetworkClient` is a wrapper class of `dio` so function can be improvised without touching core library. For
  example if we require set token for few api and not for all then we can control in this layer.
- The `NetworkException` are being thrown from this(NetworkClient) layer and parsed in the respective class. 
- A `Custom Interceptor` is placed in the network layer. We can use it whenever we require as explained in the layer.  

### State management

![coverage][state_management] ![coverage][bloc_version] ![coverage][override_bloc_version]

- This project is using `BLoC's 7.0.0` version as State management library. But as `Bloc` team is working
  on [newer version](https://github.com/felangel/bloc/tree/feat/replace-mapEventToState-with-on%3CE%3E)
  that will help to remove boilerplate of writing `mapEventsToSate` and bloc will look like this:
  ```dart 
  class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
      DashboardBloc(): super(DashboardInitial()) {
          // search images action
          on<SearchImage>(_searchImages);
      }
      
      // perform your action here
      void _searchImages(SearchImage event, Emit<DashboardState> emit) async {
          // TODO: your business logic will be here to handle state and event
      }
  }
  ```
### Log controller

![coverage][sentry_io]

- [Sentry.io](https://sentry.io/welcome/) is being used to log all errors and issues in a server.
---
## Flavours 🚀
This project contains 3 flavors:

![coverage][development] ![coverage][staging] ![coverage][production]

Before run application you need to create `.env` file in app directory and add these varaibles:

```dotenv
#Logs Controller --  create your key (https://sentry.io/welcome/) and add
SENTRY_IO=

#Shutterstock credentials -- create your key (http://api.shutterstock.com) and add
TOKEN=
API_URL=https://api.shutterstock.com/v2
```

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```


_\*Shutterstock works on iOS and Android._

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

> **Note:** *For demo purposes, I have added two locales but have same strings. We can update and even
> add more locales to support.*

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "appBarTitle": "Shutterstock",
    "@appBarTitle": {
        "description": "Text shown in the AppBar of the ShutterStock Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "appBarTitle": "Shutterstock",
    "@appBarTitle": {
        "description": "Text shown in the AppBar of the ShutterStock Page"
    }
}
```

3. Use the new string

```dart
import 'package:shutterstock/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.appBarTitle);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "appBarTitle": "Shutterstock",
    "@appBarTitle": {
        "description": "Text shown in the AppBar of the ShutterStock Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "appBarTitle": "Shutterstock",
    "@appBarTitle": {
        "description": "Text shown in the AppBar of the ShutterStock Page"
    }
}
```

---
## Dependencies 💉
We like to highlight some major dependencies:
- [dio: ^4.0.0](https://pub.dev/packages/dio) -- A powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc.
- [flutter_bloc: ^7.0.0](https://bloclibrary.dev/) -- A predictable state management library that helps implement the BLoC design.
- [pull_to_refresh: ^2.0.0](https://pub.dev/packages/pull_to_refresh) -- A widget provided to the flutter scroll component drop-down refresh and pull up load.support android and ios.
- [sentry_flutter: ^5.1.0](https://pub.dev/packages/sentry_flutter) -- This package includes support to native crashes through Sentry's native SDKs: (Android and iOS). It will capture errors in the native layer, including (Java/Kotlin/C/C++ for Android and Objective-C/Swift for iOS).
---

## Running Tests 🧪

This section is under development and will be continued after a break.

[flutter_version]: https://img.shields.io/badge/flutter-2.2.3-1389FD.svg

[dart_version]: https://img.shields.io/badge/Dart-2.13.4-1389FD.svg

[state_management]: https://img.shields.io/badge/State_Management-42b983.svg

[bloc_version]: https://img.shields.io/badge/BLoC-7.0.0-42b983.svg

[override_bloc_version]: https://img.shields.io/badge/Override_BLoC-upcoming_version-42b983.svg

[sentry_io]: https://img.shields.io/badge/Sentry-5.1.0-362d59.svg

[dio]: https://img.shields.io/badge/dio-4.0.0-4334eb.svg

[production]: https://img.shields.io/badge/Production-0bbf5c.svg

[development]: https://img.shields.io/badge/Development-b6d91c.svg

[staging]: https://img.shields.io/badge/Staging-edd013.svg

[coverage_badge]: coverage_badge.svg

[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html

[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization

[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg

[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis

