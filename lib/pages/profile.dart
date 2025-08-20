import 'package:flutter/material.dart';
import 'package:latihan1_11pplg2/components/custom_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key}); // Pastikan ada const

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile', // Pastikan tidak null
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section with Gradient
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue[600]!, Colors.blue[400]!],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile Picture with Border
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/profile_picture.png'),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Name
                  CustomText(
                    text: 'Nandita Meddina',
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  CustomText(
                    text: '11 PPLG 2',
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Info Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Student Info Card
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.blue[50]!],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.school, color: Colors.blue[600], size: 24),
                              const SizedBox(width: 12),
                              CustomText(
                                text: 'Student Information',
                                color: Colors.blue[600]!,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          _buildInfoRow(Icons.badge, 'Absen', '26'),
                          const SizedBox(height: 12),
                          _buildInfoRow(Icons.class_, 'Kelas', '11 PPLG 2'),
                          const SizedBox(height: 12),
                          _buildInfoRow(Icons.calendar_today, 'Tahun Ajaran', '2025-2026'),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Contact Info Card
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.green[50]!],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.contact_phone, color: Colors.green[600], size: 24),
                              const SizedBox(width: 12),
                              CustomText(
                                text: 'Contact Information',
                                color: Colors.green[600]!,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          _buildInfoRow(Icons.phone, 'No. HP', '0811180710'),
                          const SizedBox(height: 12),
                          _buildInfoRow(Icons.email, 'Email', 'nandita@smkn7.sch.id'),
                          const SizedBox(height: 12),
                          _buildInfoRow(Icons.location_on, 'Alamat', 'Semarang, Jawa Tengah'),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Skills Card
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.purple[50]!],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.code, color: Colors.purple[600], size: 24),
                              const SizedBox(width: 12),
                              CustomText(
                                text: 'Programming Skills',
                                color: Colors.purple[600]!,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          _buildSkillChip('Flutter'),
                          const SizedBox(height: 8),
                          _buildSkillChip('Dart'),
                          const SizedBox(height: 8),
                          _buildSkillChip('Mobile Development'),
                          const SizedBox(height: 8),
                          _buildSkillChip('UI/UX Design'),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey[600], size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: label,
                color: Colors.grey[700]!,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.left,
              ),
              CustomText(
                text: value,
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.purple[300]!),
      ),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.purple[600], size: 16),
          const SizedBox(width: 8),
          CustomText(
            text: skill,
            color: Colors.purple[800]!,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}