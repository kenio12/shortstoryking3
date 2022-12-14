import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view/writer/sub/feed_writer_page.dart';
import 'package:shortstoryking3/view/writer/sub/search_writer.dart';
import 'package:shortstoryking3/view_models/writer_view_model.dart';

class WriterPage extends StatelessWidget {
  final String? novelSelectedUserUserId;
  final PersistentTabController persistentTabController;

  WriterPage({
    this.novelSelectedUserUserId,
    required this.persistentTabController,
  });

  @override
  Widget build(BuildContext context) {
    final writerViewModel = context.read<WriterViewModel>();
    // final currentUser = writerViewModel.currentUser;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _searchWriter(context, persistentTabController),
        backgroundColor: Colors.black54,
        child: const Icon(Icons.search, size: 40,),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: Colors.white54,

        ),
      ),
      body: Container(
        // color: Colors.black12,
        child: (novelSelectedUserUserId == null)
            ? FeedWriterPage(
          feedWriterMode: FeedWriterMode.All_Writer,
          persistentTabController: persistentTabController,
        )
            : FeedWriterPage(
          feedWriterMode: FeedWriterMode.SELECTED_WRITER,
          novelSelectedUserUserId: novelSelectedUserUserId,
          persistentTabController: persistentTabController,
        ),
      ),
    );
  }

  _searchWriter(BuildContext context,
      PersistentTabController persistentTabController) {
    pushNewScreen(context,
        screen: SearchWriter(
          context: context,
          persistentTabController: persistentTabController,
        ),
        withNavBar: true
    );
  }
}
