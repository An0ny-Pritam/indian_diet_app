import 'package:flutter/material.dart';
import 'indian_food_data.dart';
import 'meal_screen.dart';

void main() {
  runApp(IndianDietApp());
}

class IndianDietApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  title: 'Indian Diet Planner',
  theme: ThemeData(
    scaffoldBackgroundColor: Color(0xFFF6FFF6),
    primarySwatch: Colors.green,
    fontFamily: 'Roboto',
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.green.shade700,
      elevation: 0,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.green.shade700,
    ),
  ),
  home: HomeScreen(),
);

  }
}



class HomeScreen extends StatelessWidget {
  final List<String> meals = ['Breakfast', 'Lunch', 'Dinner'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Indian Diet Tracker'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(meals[index]),
              subtitle: Text('Tap to log ${meals[index]} foods'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MealScreen(mealName: meals[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
