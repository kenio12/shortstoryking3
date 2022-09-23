import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/data_models/user.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view/writer/sub/writer_profile.dart';
import 'package:shortstoryking3/view_models/writer_view_model.dart';

class FeedWriterPage extends StatelessWidget {
  final FeedWriterMode feedWriterMode;

  FeedWriterPage({required this.feedWriterMode});

  @override
  Widget build(BuildContext context) {
    final writerViewModel = context.read<WriterViewModel>();
    final currentUser  = writerViewModel.currentUser;
    Future(() => writerViewModel.getWriter(feedWriterMode));

    return PageView.builder(
        controller: PageController(),
        itemCount: writerViewModel.writers!.length,
        itemBuilder: (context, index) {
          final User writer = writerViewModel.writers![index];
          // return Text("${writer.inAppUserName}");
          // return WriterProfile(writer: writer, pageController: PageController());
          //   },
          // );

          return Consumer<WriterViewModel>(
            builder: (context, model, child) {
              // model.getWriter(FeedWriterMode.All_Writer);
              if (model.isProcessing) {
                print("くるくる");
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return (model.writers == null)
                    ? Container()
                    : RefreshIndicator(
                    onRefresh: () => model.getWriter(feedWriterMode),
                    child: PageView.builder(
                        controller: PageController(),
                        itemCount: model.writers!.length,
                        itemBuilder: (context, index) {
                          final User writer = model.writers![index];
                          return WriterProfile(
                              writer: writer,
                              currentUser: currentUser,
                              pageController: PageController());
                        }));
              }
            },
          );
        }
    );
  }
}