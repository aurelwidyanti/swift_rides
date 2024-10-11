import 'package:flutter/material.dart';
import '../widgets/car_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.4),
              child: Row(
                children: [
                  Icon(Icons.location_on, size: 30, color: Colors.grey),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose Location',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      _locationPicker(),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommended Cars',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _recommendedCarsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _locationPicker() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: <String>['New York', 'Los Angeles', 'Chicago', 'Miami']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            // Handle location change
          },
          hint: Text('Select your location'),
        ),
      ),
    );
  }

  Widget _recommendedCarsList() {
    return SizedBox(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CarCard(
            name: 'Ferrari F8',
            imageUrl: 'https://linktoimage.com/ferrari.jpg',
            price: 1500,
          ),
          CarCard(
            name: 'Porsche 911',
            imageUrl: 'https://linktoimage.com/porsche.jpg',
            price: 2000,
          ),
          CarCard(
            name: 'Lamborghini Aventador',
            imageUrl: 'https://linktoimage.com/lamborghini.jpg',
            price: 2500,
          ),
        ],
      ),
    );
  }
}
