import 'package:flutter/material.dart';

abstract mixin class PaginationMixin {
  bool onScrollNotification(ScrollUpdateNotification notification);
  void loadMore();
}
