import 'package:flutter/material.dart';
import 'package:latihan1_11pplg2/components/custom_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[400]!, Colors.purple[300]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // Background Decoration
            Positioned(
              top: -50,
              right: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            Positioned(
              bottom: -80,
              left: -80,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: -30,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.05),
                ),
              ),
            ),
            
            // Main Content
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                        colors: [Colors.white, Colors.blue[50]!],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Profile Picture dengan Border
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.blue[300]!,
                              width: 4,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.3),
                                blurRadius: 15,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: const CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage('assets/images/profile_picture.png'),
                            backgroundColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 25),
                        
                        // Nama dengan styling
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: CustomText(
                            text: '✨ Nandita Meddina ✨',
                            color: Colors.blue[800]!,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 20),
                        
                        // Info dengan icon
                        _buildInfoRow(Icons.school, 'Absen', '26'),
                        const SizedBox(height: 15),
                        _buildInfoRow(Icons.class_, 'Kelas', '11 PPLG 2'),
                        const SizedBox(height: 15),
                        _buildInfoRow(Icons.phone, 'No. HP', '0811180710'),
                        const SizedBox(height: 15),
                        _buildInfoRow(Icons.location_on, 'Sekolah', 'SMK Raden Umar Said'),
                        
                        const SizedBox(height: 25),
                        
                        // Decorative bottom
                        Container(
                          width: double.infinity,
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            gradient: LinearGradient(
                              colors: [Colors.blue[300]!, Colors.purple[300]!],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.blue[600], size: 20),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: label,
                  color: Colors.grey[600]!,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.left,
                ),
                CustomText(
                  text: value,
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}