import 'package:flutter/material.dart';

class page5 extends StatefulWidget {
  const page5({super.key});

  @override
  State<page5> createState() => _page5State();
}

class _page5State extends State<page5> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Melanoma'),
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
                  '• Melanoma is a serious form of skin cancer that develops in the melanocytes (pigment-producing cells).'),
              _buildInfoText(
                  '• It can appear as a new mole or a change in an existing mole and can be black, brown, or multicolored with irregular borders.'),
              
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
                  '• Early detection is critical; perform regular skin self-exams and see a dermatologist for any suspicious moles.'),
              _buildInfoText(
                  '• Treatments include surgical removal, immunotherapy, radiation therapy, and targeted therapy.'),
               _buildInfoText(
                  '• Protect your skin from UV radiation and avoid tanning beds.'),
              
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