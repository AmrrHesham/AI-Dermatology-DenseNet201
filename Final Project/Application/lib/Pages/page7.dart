import 'package:flutter/material.dart';

class page7 extends StatefulWidget {
  const page7({super.key});

  @override
  State<page7> createState() => _page7State();
}

class _page7State extends State<page7> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text('Vascular Lesions'),
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
                  '• Abnormal growths or formations of blood vessels in or under the skin.'),
              _buildInfoText(
                  '• Appear red, purple, or blue depending on depth and type.'),
              _buildInfoText(
                  '• Can be present at birth or develop later.'),
              
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
                  '• Monitor changes: If a lesion grows, bleeds, or changes color—see a doctor.'),
              _buildInfoText(
                  '• Use sunscreen: UV exposure can worsen some vascular lesions.'),
               _buildInfoText(
                  '• Get checked: If unsure whether it’s vascular or something else (e.g., skin cancer), consult a dermatologist.'),
               _buildInfoText(
                  '• Use AI tools carefully: AI-based apps can help, but always confirm with a medical professional.'),
              
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