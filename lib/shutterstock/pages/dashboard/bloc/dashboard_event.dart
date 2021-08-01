part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {
  const DashboardEvent();

  List<Object> get props => [];
}

class SearchImage extends DashboardEvent {
  const SearchImage({required this.query});
  final String query;

  @override
  List<Object> get props => [query];
}

class LoadArtists extends DashboardEvent {}