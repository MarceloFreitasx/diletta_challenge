import 'package:flutter/material.dart';

import '../../domain/mixins/mixins.dart';

mixin PaginationManager<T> implements PaginationMixin {
  @override
  bool onScrollNotification(ScrollUpdateNotification notification) {
    if (notification.metrics.pixels >= (notification.metrics.maxScrollExtent)) {
      loadMore();
    }
    return false;
  }
}
