import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const CircleAvatar(radius: 36, child: Icon(Icons.person, size: 36)),
            const SizedBox(height: 12),
            const Text(
              'John Nicolas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              'john@example.com',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 18),
            Card(
              child: ListTile(
                title: const Text('My CV'),
                trailing: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Edit'),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(child: ListTile(title: const Text('Settings'))),
          ],
        ),
      ),
    );
  }
}
