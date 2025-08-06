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
  static const _viewportFraction = 0.45;

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
                  height: 80,
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
                  builder: (context, state) {
                    final dishes = _homeCubit.todayDishes;

                    if (state.isLoading || dishes == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return dishes.isEmpty
                        ? const Expanded(
                            child: Center(child: NoEntriesMessage()),
                          )
                        : Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: DishesListView(dishes: dishes),
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
