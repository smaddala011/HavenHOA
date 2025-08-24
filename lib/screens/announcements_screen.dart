import 'package:flutter/material.dart';

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E223D),
        title: const Text(
          'Community Announcements',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: const [
            AnnouncementCard(
              title: 'HOA Board Elections Next Week',
              date: 'Aug 10, 2025',
              description:
                  'Join us on Zoom next Thursday to vote and hear from board candidates.',
            ),
            SizedBox(height: 16),
            AnnouncementCard(
              title: 'Water Supply Interruption',
              date: 'Aug 12, 2025',
              description:
                  'Scheduled maintenance will cause a 3-hour water outage from 2–5pm.',
            ),
            SizedBox(height: 16),
            AnnouncementCard(
              title: 'Pool Renovation Updates',
              date: 'Aug 14, 2025',
              description:
                  'The pool is reopening with new tiles and filters! Come check it out!',
            ),
          ],
        ),
      ),
    );
  }
}

class AnnouncementCard extends StatelessWidget {
  final String title;
  final String date;
  final String description;

  const AnnouncementCard({
    super.key,
    required this.title,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black12,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          Text(
            date,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
