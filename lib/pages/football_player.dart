import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/football_player_kontroller.dart';
import 'package:latihan1_11pplg2/components/custom_text.dart';
import 'package:latihan1_11pplg2/pages/editplayer.dart';

class FootballPlayerPage extends StatelessWidget {
  FootballPlayerPage({super.key});

  final FootballPlayerController footballPlayerController = Get.put(FootballPlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          '⚽ Football Players',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green[600]!, Colors.green[400]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[50]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Header Stats Card
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green[400]!, Colors.green[600]!],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withAlpha((0.3 * 255).toInt()),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem('👥', 'Total Players', footballPlayerController.players.length.toString()),
                  Container(width: 1, height: 40, color: Colors.white30),
                  _buildStatItem('⚽', 'Active Squad', footballPlayerController.players.length.toString()),
                ],
              ),
            ),
            
            // Players List
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Obx(
                  () => footballPlayerController.players.isEmpty
                      ? _buildEmptyState()
                      : ListView.builder(
                          itemCount: footballPlayerController.players.length,
                          itemBuilder: (context, index) {
                            return _buildPlayerCard(context, index);
                          },
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add new player functionality
        },
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Add Player'),
        elevation: 8,
      ),
    );
  }
  
  // Add this method to handle the empty state
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.sports_soccer, size: 64, color: Colors.green[300]),
          const SizedBox(height: 16),
          CustomText(
            text: 'No players found',
            color: Colors.green[800]!,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          CustomText(
            text: 'Tap "Add Player" to create a new player.',
            color: Colors.green[700]!,
            fontSize: 14,
            fontWeight: FontWeight.normal,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String icon, String label, String value) {
    return Column(
      children: [
        Text(icon, style: const TextStyle(fontSize: 24)),
        CustomText(
          text: value,
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
        CustomText(
          text: label,
          color: Colors.white70,
          fontSize: 12,
          fontWeight: FontWeight.normal,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildPlayerCard(BuildContext context, int index) {
  final player = footballPlayerController.players[index];
  
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.white, Colors.green[250] ?? Colors.green[200]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              // Player Photo
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.green[300]!, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: player.photoUrl != null && player.photoUrl!.isNotEmpty
                      ? Image.network(
                          player.photoUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return _buildDefaultAvatar(player.name);
                          },
                        )
                      : _buildDefaultAvatar(player.name),
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Jersey Number Badge (smaller)
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green[400]!, Colors.green[600]!],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.3),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: CustomText(
                    text: player.jerseyNumber.toString(),
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Player Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: player.name,
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CustomText(
                        text: player.position,
                        color: Colors.green[800]!,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Action Buttons
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue[200]!),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.to(
                          () => const EditPlayerPage(),
                          arguments: {
                            'player': player,
                            'index': index,
                          },
                        );
                      },
                      icon: Icon(Icons.edit, color: Colors.blue[600], size: 20),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.red[200]!),
                    ),
                    child: IconButton(
                      onPressed: () {
                        _showDeleteDialog(context, index);
                      },
                      icon: Icon(Icons.delete, color: Colors.red[600], size: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

// Helper method untuk default avatar
Widget _buildDefaultAvatar(String playerName) {
  String initials = playerName.isNotEmpty 
      ? playerName.split(' ').map((name) => name[0]).take(2).join().toUpperCase()
      : 'P';
      
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.green[300]!, Colors.green[500]!],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      shape: BoxShape.circle,
    ),
    child: Center(
      child: CustomText(
        text: initials,
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        textAlign: TextAlign.center,
      ),
    ),
  );
}

  void _showDeleteDialog(BuildContext context, int index) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Delete Player'),
        content: const Text('Are you sure you want to delete this player?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancel', style: TextStyle(color: Colors.grey[600])),
          ),
          ElevatedButton(
            onPressed: () {
              footballPlayerController.players.removeAt(index);
              Get.back();
              Get.snackbar(
                'Success',
                'Player deleted successfully',
                backgroundColor: Colors.red[100],
                colorText: Colors.red[800],
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[600],
              foregroundColor: Colors.white,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}