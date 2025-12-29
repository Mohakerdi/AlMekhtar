import 'package:flutter/material.dart';

class ProfileBodySkeleton extends StatelessWidget {
  const ProfileBodySkeleton({super.key});

  Widget _buildTileSkeleton() {
    return ListTile(
      leading: const CircleAvatar(radius: 24, backgroundColor: Colors.white),
      title: Container(height: 12, width: 150, color: Colors.white),
      trailing: Container(height: 12, width: 20, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(height: 20, width: 150, color: Colors.white),
                ],
              ),
            ),
            const Divider(height: 30),
            _buildTileSkeleton(),
            _buildTileSkeleton(),
            const Divider(),
            _buildTileSkeleton(),
            _buildTileSkeleton(),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
