import 'package:caloree_app/app/router/routes.dart';
import 'package:caloree_app/flows/home/cubit/home_cubit.dart';
import 'package:caloree_app/flows/home/presentation/widgets/calendar_carousel.dart';
import 'package:caloree_app/flows/home/presentation/widgets/dishes_list_view.dart';
import 'package:caloree_app/flows/home/presentation/widgets/home_header.dart';
import 'package:caloree_app/flows/home/presentation/widgets/no_entries_message.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _initialDayIndex = 10;
  static const _viewportFraction = 0.5;

  // recommended amount of calories for human in average;
  // Of course it's better to handle this value based on user's body mass index etc.
  static const _dailyCaloriesNormalAmount = 2250;

  late final HomeCubit _homeCubit = context.read<HomeCubit>();

  final _calendarPageController = PageController(
    initialPage: _initialDayIndex,
    viewportFraction: _viewportFraction,
  );

  Drag? _scrollDragController;
  int _selectedDayIndex = _initialDayIndex;

  @override
  void initState() {
    super.initState();

    _homeCubit.loadHomeData();
    _calendarPageController.addListener(
      () {
        final page = _calendarPageController.page?.round();

        if (page != null && page != _selectedDayIndex) {
          page < _selectedDayIndex
              ? _homeCubit.goToPreviousDay()
              : _homeCubit.goToNextDay();

          _selectedDayIndex = page;
        }
      },
    );
  }

  void _onAddDishPressed(BuildContext context) {
    const AddDishPageRoute().push(context);
  }

  void _onHorizontalDragStart(DragStartDetails details) {
    _scrollDragController = _calendarPageController.position.drag(
      details,
      // ignore: no_empty_block
      () {},
    );
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    _scrollDragController?.update(details);
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    _scrollDragController?.end(details);
    _scrollDragController = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        enableFeedback: true,
        shape: const CircleBorder(),
        child: const Icon(Icons.add_rounded),
        onPressed: () => _onAddDishPressed(context),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onHorizontalDragStart: _onHorizontalDragStart,
            onHorizontalDragUpdate: _onHorizontalDragUpdate,
            onHorizontalDragEnd: _onHorizontalDragEnd,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeHeader(),
                const SizedBox(height: 24),
                SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_rounded),
                        padding: EdgeInsets.zero,
                        onPressed: () => _calendarPageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        ),
                      ),
                      Expanded(
                        child: CalendarCarousel(
                          pageController: _calendarPageController,
                          initialDate: _homeCubit.state.currentDay,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_rounded),
                        padding: EdgeInsets.zero,
                        onPressed: () => _calendarPageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        ),
                      ),
                    ],
                  ),
                ),

                BlocBuilder<HomeCubit, HomeState>(
                  builder: (_, state) {
                    final dishes = _homeCubit.todayDishes;
                    final todayCalories = _homeCubit.todayCalories;

                    if (state.isLoading ||
                        dishes == null ||
                        todayCalories == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (dishes.isEmpty) {
                      return const Expanded(
                        child: Center(child: NoEntriesMessage()),
                      );
                    }

                    return Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Today calories: $todayCalories',
                            style: TextTheme.of(context).bodyLarge,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 32,
                              right: 32,
                              bottom: 24,
                            ),

                            child: LinearProgressIndicator(
                              borderRadius: BorderRadius.circular(100),
                              value: todayCalories / _dailyCaloriesNormalAmount,
                            ),
                          ),

                          Expanded(
                            child: DishesListView(dishes: dishes),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
