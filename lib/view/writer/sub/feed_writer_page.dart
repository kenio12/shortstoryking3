import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/data_models/user.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view/novel/components/page_transformer.dart';
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

            return Consumer<WriterViewModel>(
            builder: (context, model, child) {
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
                    child: PageTransformer(
                      pageViewBuilder: (context,pageVisibilityResolver){
                        return PageView.builder(
                            controller: PageController(viewportFraction: 0.9),
                            itemCount: model.writers!.length,
                            itemBuilder: (context, index) {
                              final User writer = model.writers![index];
                              final pageVisibility = pageVisibilityResolver.
                              resolvePageVisibility(index);
                              final visibleFraction = pageVisibility.visibleFraction;
                              return Container(
                                color: Colors.black26,
                                child: WriterProfile(
                                    writer: writer,
                                    currentUser: currentUser,
                                    pageController: PageController(),
                                    pageVisibility: pageVisibility
                                ),
                              );
                            });
                      },
                    ));
              }
            },
          );
        }
  }