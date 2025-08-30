import 'package:flutter/material.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Basal Cell Carcinoma (BCC)'),
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
                  '• Basal cell carcinoma is the most common type of skin cancer, arising from the basal cells in the skin.'),
              _buildInfoText(
                  '• Appears as a translucent bump, often on sun-exposed areas such as the face and neck.'),
              
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
                  '• Early detection and treatment are crucial; see a dermatologist if you notice any new, unusual growths.'),
              _buildInfoText(
                  '• Treatment options include surgical excision, Mohs surgery, cryotherapy, and topical treatments.'),
              _buildInfoText(
                  '• Practice sun safety to prevent further damage.'),
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