import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesi4/controller/feed_controller.dart';
import 'package:sesi4/view/feed_book.dart';
import 'package:sesi4/view/feed_card.dart';
import 'package:sesi4/view/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Untuk BottomNavigationBar
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi berdasarkan index yang dipilih
    if (index == 0) {
      // Tombol Home
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else if (index == 1) {
      // Tombol Profil
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const Profile()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FeedController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ngokinsgram',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FeedBookmarkPage(),
                ),
              );
            },
            icon: const Icon(Icons.bookmark_outline),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          controller.refresh();
        },
        child: ListView.builder(
          itemCount: controller.length, // Pastikan controller memiliki length
          itemBuilder: (context, index) => FeedCard(
            feed: controller.feed(index),
          ),
        ),
      ),
      // Bottom Navigation Bar untuk tombol "Homepage" dan "Profil"
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ikon untuk Homepage
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), // Ikon untuk Profil
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
