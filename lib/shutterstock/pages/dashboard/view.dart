import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shutterstock/l10n/l10n.dart';
import 'package:shutterstock/shutterstock/base_page/base_page.dart';
import 'package:shutterstock/shutterstock/global/global.dart';

import 'bloc/dashboard_bloc.dart';
import 'component/component.dart';

class DashboardPage extends BasePage {
  DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends BaseState<DashboardPage> with BasicPage {
  late RefreshController _refreshController;
  late DashboardBloc _dashboardBloc;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    _dashboardBloc = context.read<DashboardBloc>();
  }

  @override
  Widget body(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: _getBody(l10n),
    );
  }

  Widget _getBody(final l10n) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (_, state) {
        if (state is DashboardFailure) {
          _refreshController.loadComplete();
        }
        if (state is DashboardInitial) {
          _refreshController.resetNoData();
        }
        if (state is ImagesListEnds) {
          _refreshController.loadComplete();
          return;
        }
        if (state is ImagesLoadedState) {
          if (state.imagesData!.isEmpty) {
            _refreshController.resetNoData();
          }
        }
      },
      buildWhen: (pre, curr) {
        if (curr is DashboardInitial) {
          return true;
        }
        if (curr is DashboardLoading) {
          return true;
        }
        if (curr is ImagesLoadedState) {
          _refreshController.loadComplete();
          if (curr.reachedMaximum) {
            return false;
          }
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is DashboardInitial) {
          return Center(child: Text(l10n.imagesNotFoundMessage));
        }

        if (state is DashboardLoading) {
          return BottomLoader();
        }

        if (state is ImagesLoadedState) {
          if (state.reachedMaximum) {
            _refreshController.loadNoData();
          }
          return SmartRefresher(
            enablePullDown: false,
            enablePullUp: true,
            controller: _refreshController,
            onLoading: loadRequests,
            child: ListView.separated(
              itemCount: state.imagesData!.length,
              separatorBuilder: (_, index) => const SizedBox(height: 6),
              itemBuilder: (_, int index) {
                return index >= state.imagesData!.length
                    ? BottomLoader()
                    : ArtistListItem(
                        imageAssets: state.imagesData![index].assets!,
                      );
              },
            ),
          );
        }

        return const SizedBox();
      },
    );
  }

  void loadRequests() {
    _refreshController.requestLoading();
    _dashboardBloc.add(LoadImages());
  }

  @override
  PreferredSizeWidget appBar(BuildContext context) {
    final l10n = context.l10n;

    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      elevation: 0.0,
      title: Text(l10n.appBarTitle),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: BlocProvider.value(
          value: _dashboardBloc,
          child: SearchBar(),
        ),
      ),
    );
  }
}
