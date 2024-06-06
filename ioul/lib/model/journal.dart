class Journal {
  String? journalName;
  String? url;

  Journal({
    this.journalName,
    this.url,
  });

  factory Journal.fromJson(Map<String, dynamic> json) {
    return Journal(
      journalName: json['journal_name'],
      url: json['url'],
    );
  }
}
