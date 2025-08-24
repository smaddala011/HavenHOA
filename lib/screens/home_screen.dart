import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E223D),
        title: const Text(
          'Welcome to HavenHOA',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🧾 Dues Summary Box
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Dues',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '\$350.00',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0E223D),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0E223D),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Pay Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Recent Announcements',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 16),

            // 📣 Announcement Card
            Expanded(
              child: ListView(
                children: const [
                  AnnouncementTile(
                    title: 'Pool Closed This Saturday',
                    date: 'Aug 10, 2025',
                  ),
                  SizedBox(height: 12),
                  AnnouncementTile(
                    title: 'Annual HOA Meeting on Zoom',
                    date: 'Aug 15, 2025',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AnnouncementTile extends StatelessWidget {
  final String title;
  final String date;

  const AnnouncementTile({
    super.key,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black12,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          Text(
            date,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
