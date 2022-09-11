import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfoliome/core/constants/app_colors.dart';
import 'package:portfoliome/core/constants/app_constraints.dart';
import 'package:portfoliome/weather/domain/blocs/main_screen/main_screen_bloc.dart';
import 'package:portfoliome/weather/presentation/screens/main_screen/astronomy_widget.dart';
import 'package:portfoliome/weather/presentation/screens/main_screen/detailed_content_widget.dart';
import 'package:portfoliome/weather/presentation/widgets/custom_shimmer.dart';
import 'package:portfoliome/weather/presentation/widgets/tag_icon.dart';

import 'current_weather_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainScreenBloc>()..getData();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CupertinoScrollbar(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.width * 0.75,
              stretch: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [StretchMode.zoomBackground],
                background: BlocConsumer<MainScreenBloc, MainScreenState>(
                  bloc: bloc,
                  listener: (_, state) {},
                  builder: (context, state) {
                    return CurrentWeather(
                      isLoading: state is MainScreenDataLoading,
                      weather: state is MainScreenDataLoaded ? state.weather : null,
                    );
                  },
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.settings_solid),
                ),
              ],
            ),
            SliverFillRemaining(
              fillOverscroll: true,
              hasScrollBody: false,
              child: Container(
                height: 800,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  borderRadius: AppConstraints.borderRadiusTLR,
                  color: AppColors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 4.0),
                    const TagIcon(),
                    const SizedBox(height: AppConstraints.padding),
                    SizedBox(
                      height: 100,
                      child: BlocBuilder<MainScreenBloc, MainScreenState>(
                        bloc: bloc,
                        builder: (context, state) {
                          return CustomShimmer(
                            isLoading: state is MainScreenDataLoading,
                            child: AstronomyWidget(
                              astronomy: state is MainScreenDataLoaded ? state.astronomy : null,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: AppConstraints.padding),
                    BlocBuilder<MainScreenBloc, MainScreenState>(
                      bloc: bloc,
                      builder: (context, state) {
                        return CustomShimmer(
                          isLoading: state is MainScreenDataLoading,
                          child: DetailedContentWidget(
                            weather: state is MainScreenDataLoaded ? state.weather : null,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
