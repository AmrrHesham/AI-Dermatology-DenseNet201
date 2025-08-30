import 'package:flutter/material.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actinic Keratoses (AK)'),
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
                  '• Actinic keratoses are rough, scaly patches on the skin caused by excessive exposure to the sun.'),
              _buildInfoText(
                  '• They are considered precancerous and can develop into squamous cell carcinoma if left untreated.'),
              _buildInfoText(
                  '• Commonly found on the face, lips, ears, back of the hands, forearms, scalp, or neck.'),
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
                  '• Regularly check your skin for any new or changing lesions.'),
              _buildInfoText(
                  '• Protect your skin from sun exposure by using sunscreen, wearing protective clothing, and avoiding the sun during peak hours.'),
              _buildInfoText(
                  '• Consult a dermatologist for treatments such as cryotherapy, topical medications, or laser therapy.'),
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