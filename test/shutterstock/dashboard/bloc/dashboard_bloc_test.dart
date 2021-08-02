import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shutterstock/shutterstock/shutterstock.dart';
import 'package:shutterstock_repository/shutterstock_repository.dart';

class ShutterstockRepository extends Mock implements ShutterStockRepository {}

void main() {
  group('DashboardBloc', () {
    late ShutterstockRepository repository;
    late DashboardBloc dashboardBloc;

    setUp(() {
      repository = ShutterstockRepository();
      dashboardBloc = DashboardBloc(repository);
    });

    group('SearchImage', () {
      blocTest(
        'emits [] when nothing is added',
        build: () => DashboardBloc(repository),
        expect: () => [],
      );
    });

    group('ImagesRequested', () {
      blocTest<DashboardBloc, DashboardState>(
        'emits [DashboardInitial] when user try fetch images without query',
        build: () => dashboardBloc,
        act: (bloc) => bloc.add(const SearchImage(query: '')),
        expect: () => [DashboardInitial()],
      );
    });
  });
}
