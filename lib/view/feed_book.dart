import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesi4/controller/feed_controller.dart';
import 'package:sesi4/view/feed_card.dart';

class FeedBookmarkPage extends StatelessWidget {
  const FeedBookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FeedController>();

    // Asumsi: controller.bookmarkedFeeds adalah daftar feed yang di-bookmark.
    final bookmarkedFeeds = controller.bookmarkedFeeds;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bookmarks',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: bookmarkedFeeds.isEmpty
          ? const Center(
              child: Text(
                'No bookmarks yet!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            )
          : ListView.builder(
              itemCount: bookmarkedFeeds.length,
              itemBuilder: (context, index) => FeedCard(
                feed: bookmarkedFeeds[index],
              ),
            ),
    );
  }
}