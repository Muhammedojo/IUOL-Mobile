class SearchCollectionEvent extends CollectionEvent {
  final String searchTerm;

  SearchCollectionEvent(this.searchTerm);
}

abstract class CollectionEvent {}
