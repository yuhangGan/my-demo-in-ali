// import 'dart:js';

import './views/doc_home_page/doc_home_page.dart';
import './views/home/home.dart';
import './views/expert/expert.dart';
import './views/new_comment/new_comment.dart';

final routes = {
  '/': (context) => Home(),
  '/home': (context) => Home(),
  '/expert': (context) => Expert(),
  '/new_comment': (context) => NewComment(),
  '/doc_home_page': (context) => DoctorHomePage()
};
