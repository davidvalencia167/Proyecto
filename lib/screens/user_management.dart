import 'package:flutter/material.dart';

class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Users'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Add new user logic
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // User Profile Header
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  child: Icon(
                    Icons.person,
                    color: Colors.grey[600],
                    size: 60,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'User Administrator',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // User List
          Expanded(
            child: ListView(
              children: [
                _buildUserListItem(
                  name: 'Charles Robinson',
                  role: 'Admin',
                  imageUrl: null,
                ),
                _buildUserListItem(
                  name: 'Ashley Watson',
                  role: 'User',
                  imageUrl: null,
                ),
                _buildUserListItem(
                  name: 'Sarah Jackson',
                  role: 'User',
                  imageUrl: null,
                ),
              ],
            ),
          ),

          // Logout Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Logout logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  side: const BorderSide(color: Colors.blue),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build user list items
  Widget _buildUserListItem({
    required String name,
    required String role,
    String? imageUrl,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: imageUrl != null
            ? Image.network(imageUrl)
            : Icon(Icons.person, color: Colors.grey[600]),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(role),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Edit user logic
            },
          ),
          IconButton(
            icon: const Icon(Icons.group_add),
            onPressed: () {
              // Add to group logic
            },
          ),
        ],
      ),
    );
  }
}