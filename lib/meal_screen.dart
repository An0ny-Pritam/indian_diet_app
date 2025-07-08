import 'package:flutter/material.dart';
import 'indian_food_data.dart';
import 'food_search_screen.dart'; // Ensure this screen exists

class MealScreen extends StatefulWidget {
  final String mealName;

  MealScreen({required this.mealName});

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  final List<Map<String, dynamic>> selectedFoods = [];

  void addFood(IndianFood food, int quantity) {
    setState(() {
      selectedFoods.add({'food': food, 'quantity': quantity});
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalCalories = 0;
    double totalProtein = 0;
    double totalCarbs = 0;
    double totalFat = 0;

    for (var item in selectedFoods) {
      final food = item['food'];
      final qty = item['quantity'];
      totalCalories += food.calories * qty;
      totalProtein += food.protein * qty;
      totalCarbs += food.carbs * qty;
      totalFat += food.fat * qty;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.mealName}'),
        backgroundColor: Colors.green.shade700,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Colors.green.shade100,
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Nutrition for ${widget.mealName}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'Calories: ${totalCalories.toStringAsFixed(1)} kcal\n'
                  'Protein: ${totalProtein.toStringAsFixed(1)}g   '
                  'Carbs: ${totalCarbs.toStringAsFixed(1)}g   '
                  'Fat: ${totalFat.toStringAsFixed(1)}g',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: selectedFoods.isEmpty
                ? Center(
                    child: Text(
                      'No foods added yet.\nTap the "+" to add.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: selectedFoods.length,
                    itemBuilder: (context, index) {
                      final food = selectedFoods[index]['food'];
                      final qty = selectedFoods[index]['quantity'];

                      return Card(
                        elevation: 3,
                        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              food.imageUrl,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.image, size: 40, color: Colors.grey),
                            ),
                          ),
                          title: Text('${food.name} × $qty',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(
                            'Calories: ${(food.calories * qty).toStringAsFixed(1)} kcal\n'
                            'Protein: ${(food.protein * qty).toStringAsFixed(1)}g, '
                            'Carbs: ${(food.carbs * qty).toStringAsFixed(1)}g, '
                            'Fat: ${(food.fat * qty).toStringAsFixed(1)}g',
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodSearchScreen(onFoodSelected: addFood),
            ),
          );
        },
        icon: Icon(Icons.add),
        label: Text('Add Food'),
      ),
    );
  }
}
