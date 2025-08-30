import 'package:flutter/material.dart';

class page3 extends StatefulWidget {
  const page3({super.key});

  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Benign Keratosis-like Lesions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Information:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              _buildInfoText(
                  '• These include seborrheic keratoses, which are noncancerous skin growths that appear as brown, black, or light tan spots.'),
              _buildInfoText(
                  '• Often have a waxy, scaly, slightly elevated appearance.'),
              
              SizedBox(height: 20),
              Text(
                'Advice:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                 
                ),
              ),
              SizedBox(height: 10),
              _buildInfoText(
                  '• Generally, no treatment is necessary unless the lesions become irritated or cosmetically concerning.'),
              _buildInfoText(
                  '• If you notice rapid changes in size, color, or shape, consult a dermatologist to rule out malignancy.'),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 18,),
      ),
    );
  }
}