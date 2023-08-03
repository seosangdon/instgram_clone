import 'package:flutter_clone_instgram/src/models/post.dart';
import 'package:flutter_clone_instgram/src/repository/post_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Post> postList = <Post>[].obs;
  @override
  void onInit() {
    super.onInit();
    _loadFeedList();
  }

  void _loadFeedList() async {
    var feedList = await PostRepository.loadFeedList();
    postList.addAll(feedList);
  }
}
