part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {
  const DashboardState();

  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class ImagesListEnds extends DashboardState {}

class DashboardFailure extends DashboardState {
  const DashboardFailure(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}

class ImagesLoadedState extends DashboardState {
  const ImagesLoadedState({
    this.query,
    this.shutterstockImages,
    this.currentPage,
    this.reachedMaximum = false,
  });

  final String? query;
  final ShutterstockImages? shutterstockImages;
  final int? currentPage;
  final bool reachedMaximum;

  @override
  List<Object> get props => [
        query!,
        shutterstockImages!,
        currentPage!,
        reachedMaximum,
      ];
}

class NoMoreArtists extends DashboardState {}
