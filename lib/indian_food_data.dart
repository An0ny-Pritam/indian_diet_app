class IndianFood {
  final String name;
  final double calories;
  final double protein;
  final double carbs;
  final double fat;
  final String imageUrl;

  IndianFood({
    required this.name,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.imageUrl,
  });
}

final List<IndianFood> indianFoods = [
  IndianFood(
    name: 'Dosa',
    calories: 120,
    protein: 3,
    carbs: 20,
    fat: 4,
    imageUrl: 'https://www.indianhealthyrecipes.com/wp-content/uploads/2021/12/dosa-recipe.jpg',
  ),
  IndianFood(
    name: 'Paneer Butter Masala',
    calories: 320,
    protein: 12,
    carbs: 10,
    fat: 25,
    imageUrl: 'https://www.ruchiskitchen.com/wp-content/uploads/2020/12/Paneer-butter-masala-recipe-3-500x500.jpg',
  ),
  IndianFood(
    name: 'Dal Tadka',
    calories: 180,
    protein: 9,
    carbs: 22,
    fat: 8,
    imageUrl: 'https://www.indianhealthyrecipes.com/wp-content/uploads/2021/04/dal-tadka-recipe-500x500.jpg',
  ),
  IndianFood(
    name: 'Chapati',
    calories: 104,
    protein: 3,
    carbs: 18,
    fat: 3,
    imageUrl: 'https://cdn3.foodviva.com/static-content/food-images/roti-paratha-recipes/roti-chapati/roti-chapati-1.jpg',
  ),
];
