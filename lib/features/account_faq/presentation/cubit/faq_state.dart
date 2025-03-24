class FAQState {
  final int selectedIndex;

  FAQState({this.selectedIndex = -1});

  FAQState copyWith({int? selectedIndex}) {
    return FAQState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
