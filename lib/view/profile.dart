import 'package:flutter/material.dart';
import 'package:sesi4/view/feed_book.dart'; // Pastikan FeedBookmarkPage sudah ada
import 'package:sesi4/view/home_page.dart'; // Pastikan HomePage sudah ada

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Logika pengaturan profil (opsional)
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Bagian Akun Pengguna (Avatar, Nama, Username)
            Column(
              children: [
                // Gambar profil
                CircleAvatar(
                  radius: 50, // Ukuran avatar
                  backgroundImage: NetworkImage('https://www.example.com/avatar.jpg'), // Ganti dengan gambar avatar pengguna
                ),
                const SizedBox(height: 16), // Jarak antara avatar dan nama
                // Menampilkan Nama Pengguna dan Username di tengah
                Center(
                  child: Column(
                    children: const [
                      Text(
                        'Nama Pengguna', // Ganti dengan nama pengguna
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '@username', // Ganti dengan username pengguna
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32), // Jarak antara nama dan tombol
              ],
            ),

            // List item untuk navigasi
            ListTile(
              title: const Text('Bookmark'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FeedBookmarkPage(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Homepage'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                _logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi logout
  void _logout(BuildContext context) {
    // Logika logout, misalnya menghapus sesi pengguna atau token
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }
}
