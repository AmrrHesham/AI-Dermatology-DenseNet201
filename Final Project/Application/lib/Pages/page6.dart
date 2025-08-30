import 'package:flutter/material.dart';

class page6 extends StatefulWidget {
  const page6({super.key});

  @override
  State<page6> createState() => _page6State();
}

class _page6State extends State<page6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Melanocytic Nevi (Moles)'),
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
                  '• Moles are benign growths of melanocytes and are common skin lesions.'),
              _buildInfoText(
                  '• They can be flat or raised and vary in color from flesh-toned to dark brown.'),
              
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
                  '• Regularly monitor moles for changes in size, color, shape, or texture.'),
              _buildInfoText(
                  '• Consult a dermatologist if you notice any changes or if a mole becomes symptomatic.'),
               _buildInfoText(
                  '• Protect your skin from excessive sun exposure to prevent new moles from forming.'),
              
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