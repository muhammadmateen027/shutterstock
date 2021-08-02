import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:shutterstock/shutterstock/shutterstock.dart';
import 'package:shutterstock_repository/shutterstock_repository.dart';

class ShutterstockRepository extends Mock implements ShutterStockRepository {}

class MockResponse extends Mock implements Response {}

void main() {
  group('DashboardBloc', () {
    late ShutterstockRepository repository;
    late DashboardBloc dashboardBloc;
    late var response;

    setUp(() {
      repository = ShutterstockRepository();
      response = MockResponse();
      dashboardBloc = DashboardBloc(repository);
    });

    group('SearchImage', () {
      blocTest(
        'emits [] when nothing is added',
        build: () => DashboardBloc(repository),
        expect: () => [],
      );
    });

    group('ImagesRequested-Initial', () {
      blocTest<DashboardBloc, DashboardState>(
        'emits [DashboardInitial] when user try fetch images without query',
        build: () => dashboardBloc,
        act: (bloc) => bloc.add(const SearchImage(query: '')),
        expect: () => [DashboardInitial()],
      );
    });

    group('ImagesRequested', () {
      final mockResponse = Response(
        data: {
          "page": 1,
          "per_page": 1,
          "total_count": 161330,
          "search_id": "39361e12-5035-4b18-9561-0e628ab4df9e",
          "data": [
            {
              "id": "1918660403",
              "aspect": 1.5,
              "assets": {
                "preview": {
                  "height": 300,
                  "url": "",
                  "width": 450
                }
              },
              "description": "Athletic man climbs an overhanging rock with rope",
              "image_type": "photo",
              "has_model_release": true,
              "media_type": "image"
            }
          ]
        },
        requestOptions: RequestOptions(data: null, path: ''),
        statusCode: 200,
      );

      var shutterStockImages = ShutterstockImages.fromJson(response.data);

      blocTest<DashboardBloc, DashboardState>(
          'emits [DashboardLoading, ImagesLoadedState] on SearchImage event',
          build: () {
            when(() => response.data).thenReturn(mockResponse.data);
            // when(() => repository.searchImages('mountain')).thenAnswer(
            //   (_) async => response,
            // );
            return dashboardBloc;
          },
          act: (bloc) => bloc.add(const SearchImage(query: 'mountain')),
          expect: () => [
                DashboardLoading(),
                ImagesLoadedState(
                  query: 'mountain',
                  imagesData: shutterStockImages.data,
                  currentPage: 1,
                ),
              ],
          verify: (_) {
            verify(() => repository.searchImages('mountain')).called(1);
          });
    });
  });
}
