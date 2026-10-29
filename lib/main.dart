import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil Mahasiswa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String userName = 'Fikri Bintang Purnomo';
  final String nim = '1122140142';
  final String role = 'Mobile Developer & Mahasiswa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Profil Pengguna',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1E293B),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          children: [
            const ProfileAvatar(),
            const SizedBox(height: 16),
            ProfileInfo(
              userName: userName,
              nim: nim,
              role: role,
            ),
            const SizedBox(height: 20),
            const ProfileStats(),
          ],
        ),
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF3B82F6), width: 2),
      ),
      child: const CircleAvatar(
        radius: 50,
        backgroundColor: Color(0xFFEFF6FF),
        child: Icon(Icons.person, size: 55, color: Color(0xFF2563EB)),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String userName;
  final String nim;
  final String role;

  const ProfileInfo({
    super.key,
    required this.userName,
    required this.nim,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          userName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
            color: const Color(0xFFEEF2FF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            'NIM: $nim',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4F46E5),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          role,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF64748B),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          StatItem(count: '6', label: 'Proyek'),
          SizedBox(
            height: 28,
            child: VerticalDivider(color: Color(0xFFE2E8F0), thickness: 1),
          ),
          StatItem(count: '3.85', label: 'IPK'),
          SizedBox(
            height: 28,
            child: VerticalDivider(color: Color(0xFFE2E8F0), thickness: 1),
          ),
          StatItem(count: 'Sem 5', label: 'Semester'),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String count;
  final String label;

  const StatItem({
    super.key,
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2563EB),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF64748B),
          ),
        ),
      ],
    );
  }
}
