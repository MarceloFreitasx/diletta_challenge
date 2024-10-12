class OptionsParams {
  int limit;
  int offset;

  OptionsParams({
    this.limit = 20,
    this.offset = 0,
  });

  void nextPage() {
    offset += limit;
  }

  void resetPages() {
    offset = 0;
  }

  Map<String, dynamic> toMap() => {
        "limit": limit,
        "offset": offset,
      }..removeWhere((key, value) => value == null || value == "");
}
