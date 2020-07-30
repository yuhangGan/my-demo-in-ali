// {
//   'user': '豆**呀',
//   'stars': 2,
//   'date': '2020.4.2',
//   'tags': ['回复很及时', '解答很有帮助', '给了治疗建议'],
//   'content': '很快收到了回复，给的用药建议非常好！而且咨询过程中医生态度特别好。'
// },
class Comment {
  String content;
  String user;
  int stars;
  String date;
  List<String> tags;
  Comment();

  Comment.fromMap(Map data) {
    this.content = data['content'];
    this.user = data['user'];
    this.stars = data['stars'];
    this.tags = data['tags'];
    this.date = data['date'];
  }

  Map toMap() {
    return {
      'content': this.content,
      'user': this.user,
      'stars': this.stars,
      'tags': this.tags,
      'date': this.date
    };
  }
}
