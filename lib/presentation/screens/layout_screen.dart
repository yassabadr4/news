import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app03/data/cubit/cubit.dart';
import 'package:news_app03/data/cubit/states.dart';
import 'package:news_app03/presentation/screens/business_screen.dart';
import 'package:news_app03/presentation/screens/science_screen.dart';
import 'package:news_app03/presentation/screens/search_screen.dart';
import 'package:news_app03/presentation/screens/sports_screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = AppCubit.i(context);
        return Scaffold(
          appBar: AppBar(
            title:  Text(
              "News",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 20
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const SearchScreen(),
                      ));
                },
                icon: const Icon(Icons.search, color: Colors.blueGrey),
              ),
              IconButton(
                onPressed: () => cubit.changeThemeMode(),
                icon: const Icon(Icons.dark_mode, color: Colors.blueGrey),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              cubit.changeCurrentIndex(value);
            },
            currentIndex: cubit.currentIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.business), label: "Business"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science), label: "Science"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports), label: "Sports"),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: cubit.screens[cubit.currentIndex],
          ),
        );
      },
    );
  }
}
