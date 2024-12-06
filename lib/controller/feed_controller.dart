import 'package:flutter/material.dart';
import 'package:sesi4/model/feed.dart';
import 'package:sesi4/model/feed_repository.dart';

class FeedController extends ChangeNotifier {
  List<Feed> feeds = FeedRepository().fetch();
  int get length => feeds.length;

List<Feed>  get bookmarkedFeeds => feeds.where((Element) => Element.content.isBookmarked == true).toList();

  Feed feed(int index) {
    return feeds[index];
  }

  // Method untuk like/unlike
  like(Feed feed) {
    feeds
        .firstWhere(
          (Element) => Element.id == feed.id,
        )
        .content.isLike = !feed.content.isLike;
    notifyListeners();
  }

  // Method untuk toggle bookmark
  toggleBookmark(Feed feed) {
    feeds
        .firstWhere(
          (Element) => Element.id == feed.id,
        )
        .content.isBookmarked = !feed.content.isBookmarked;
    notifyListeners();
  }

  // Refresh data feed
  refresh() {
    feeds = FeedRepository().fetch();
    notifyListeners();
  }
}