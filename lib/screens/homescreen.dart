import 'package:app/cubits/internet_cubit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _currentIndex = 2;
  final items = ["Android", "iOS", "Desktop", "Web"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text("Cubit Pattern- Connectivity test"),
      ),
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state == InternetState.Gained) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Internet Connected!'),
                  backgroundColor: Colors.green,
                ));
              } else if (state == InternetState.Lost) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Internet Disconnected!'),
                  backgroundColor: Colors.red,
                ));
              }
            },
            builder: (context, state) {
              // if (state == ) is used to check value
              // if (state is ) is used to check datatype
              if (state == InternetState.Gained) {
                return const Text("connected");
              } else if (state == InternetState.Lost) {
                return const Text("not connected");
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.blue,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.blue,
        height: 55,
        items: const <Widget>[
          Icon(FontAwesomeIcons.user, color: Colors.white, size: 20.0),
          Icon(FontAwesomeIcons.calendarAlt, color: Colors.white, size: 20.0),
          Icon(Icons.home, color: Colors.white, size: 25.0),
          Icon(Icons.favorite, color: Colors.white, size: 25.0),
          Icon(Icons.settings, color: Colors.white, size: 20.0),
        ],
        index: _currentIndex,
        animationDuration: const Duration(
          milliseconds: 300,
        ),
        animationCurve: Curves.bounceInOut,
        onTap: (index) {},
      ),
    );
  }
}
