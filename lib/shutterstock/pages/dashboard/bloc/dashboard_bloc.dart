import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
    // First of all. it will check either last state is ImagesLoadedState
    // then it'll load more data.
    on<LoadImages>(_loadImages);
  }

  final RepositoryService repository;

  void _searchImages(SearchImage event, Emit<DashboardState> emit) async {
    if (event.query.isEmpty) {
      emit(DashboardInitial());
      return;
    }

    emit(DashboardLoading());

    try {
      final response = await repository.searchImages(event.query);
      var shutterStockImages = await ShutterstockImages.fromJson(response.data);
      // var shutterStockImages = await compute(_parseJson, response.data);

      if (shutterStockImages.data!.isEmpty) {
        emit(DashboardInitial());
        return;
      }

      emit(
        ImagesLoadedState(
          query: event.query,
          imagesData: shutterStockImages.data,
          currentPage: shutterStockImages.page,
          reachedMaximum:
              (shutterStockImages.page == shutterStockImages.totalCount),
        ),
      );
      return;
    } on NetworkException catch (error) {
      emit(DashboardFailure(error.getDetail()));
      return;
    }
  }

  void _loadImages(LoadImages event, Emit<DashboardState> emit) async {
    try {
      if (state is ImagesLoadedState) {
        var currentState = (state as ImagesLoadedState);

        if (currentState.reachedMaximum) {
          emit(ImagesListEnds());
          return;
        }

        if (currentState.query!.isEmpty) {
          emit(DashboardInitial());
          return;
        }

        final response = await repository.searchImages(
          currentState.query!,
          (currentState.currentPage! + 1),
        );

        var shutterStockImages = await compute(_parseJson, response.data);

        if (shutterStockImages.data!.isEmpty) {
          emit(ImagesListEnds());
          return;
        }

        List<Data>? list = List.of(currentState.imagesData!)
          ..addAll(shutterStockImages.data!);

        emit(ImagesLoadedState(
            query: currentState.query,
            imagesData: list,
            currentPage: shutterStockImages.page,
            reachedMaximum:
                (shutterStockImages.page == shutterStockImages.totalCount)));

        return;
      }
    } on NetworkException {
      emit(const DashboardFailure('Unable to load'));
      return;
    }
  }
}

ShutterstockImages _parseJson(dynamic response) {
  return ShutterstockImages.fromJson(response);
}
