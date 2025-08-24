import 'package:flutter/material.dart';

class DuesScreen extends StatelessWidget {
  const DuesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E223D),
        title: const Text(
          'Your Dues',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 💰 Dues Summary Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black12,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Amount Due',
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '\$350.00',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0E223D),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Due by: Aug 15, 2025',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Add Stripe or Firebase integration
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0E223D),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
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
              'Recent Payments',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 12),

            // 💸 Dummy Payments List
            Expanded(
              child: ListView(
                children: const [
                  PaymentTile(amount: '\$350.00', date: 'May 15, 2025'),
                  PaymentTile(amount: '\$350.00', date: 'Feb 15, 2025'),
                  PaymentTile(amount: '\$350.00', date: 'Nov 15, 2024'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentTile extends StatelessWidget {
  final String amount;
  final String date;

  const PaymentTile({
    super.key,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
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
          Text(amount, style: const TextStyle(fontSize: 16)),
          Text(date,
              style: const TextStyle(color: Colors.black54, fontSize: 14)),
        ],
      ),
    );
  }
}
