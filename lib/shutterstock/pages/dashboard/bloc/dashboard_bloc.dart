import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:network/network.dart';
import 'package:shutterstock_repository/shutterstock_repository.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(this.repository) : super(DashboardInitial()) {
    // When user hit search button then this function will gives a respective
    // result. It'll call the api to fetch data
    on<SearchImage>(_searchImages);

    // When user try to load more data, this function will be called
    // First of all. it will check either last state is ArtistsLoadedState
    // then it'll load more data.
    // on<LoadArtists>(_loadArtist);
  }

  final RepositoryService repository;

  void _searchImages(SearchImage event, Emit<DashboardState> emit) async {
    if (event.query.isEmpty) {
      emit(DashboardInitial());
      return;
    }

    try {
      emit(DashboardLoading());

      final response = await repository.searchImages(event.query);
      var shutterstockImages = await compute(_parseJson, response.data);

      if (shutterstockImages.data!.isEmpty) {
        emit(DashboardInitial());
        return;
      }

      emit(ImagesLoadedState(
          query: event.query,
          shutterstockImages: shutterstockImages,
          currentPage: shutterstockImages.page,
          reachedMaximum:
              (shutterstockImages.page == shutterstockImages.totalCount)));

      return;
    } on NetworkException {
      emit(const DashboardFailure('Unable to load'));
      return;
    }
  }
}

ShutterstockImages _parseJson(dynamic response) {
 return ShutterstockImages.fromJson(response);
}
