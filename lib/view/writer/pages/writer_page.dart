import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view/writer/sub/feed_writer_page.dart';
import 'package:shortstoryking3/view_models/writer_view_model.dart';

class WriterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final writerViewModel = context.read<WriterViewModel>();
    final currentUser = writerViewModel.currentUser;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black12,
          child: FeedWriterPage(
            feedWriterMode: FeedWriterMode.All_Writer,
          ),
        ),
      ),
    );
  }
}
