import 'package:flutter/material.dart';
import 'indian_food_data.dart';

class FoodSearchScreen extends StatefulWidget {
  final Function(IndianFood, int) onFoodSelected;

  FoodSearchScreen({required this.onFoodSelected});

  @override
  _FoodSearchScreenState createState() => _FoodSearchScreenState();
}

class _FoodSearchScreenState extends State<FoodSearchScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    List<IndianFood> filteredFoods = indianFoods.where((food) {
      return food.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Search Food')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(labelText: 'Search'),
              onChanged: (value) => setState(() => query = value),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredFoods.length,
              itemBuilder: (context, index) {
                final food = filteredFoods[index];
                return ListTile(
                  title: Text(food.name),
                  subtitle: Text('Calories: ${food.calories} kcal'),
                  onTap: () {
                    _showQuantityDialog(food);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showQuantityDialog(IndianFood food) {
    int quantity = 1;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Add ${food.name}'),
        content: Row(
          children: [
            Text("Quantity: "),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  quantity = int.tryParse(value) ?? 1;
                },
                decoration: InputDecoration(hintText: 'e.g. 2'),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              widget.onFoodSelected(food, quantity);
              Navigator.pop(context); // close dialog
              Navigator.pop(context); // go back to meal screen
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}
