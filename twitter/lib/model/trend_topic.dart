class TrendTopic {
  String? locatioon;
  String? hashtag;
  String? tweet;

  TrendTopic({this.locatioon, this.hashtag, this.tweet});

  TrendTopic.fromJson(Map<String, dynamic> json) {
    locatioon = json['Locatioon'];
    hashtag = json['hashtag'];
    tweet = json['tweet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Locatioon'] = this.locatioon;
    data['hashtag'] = this.hashtag;
    data['tweet'] = this.tweet;
    return data;
  }
}
