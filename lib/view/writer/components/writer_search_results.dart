import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/writer_view_model.dart';

class WriterSearchResults extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<WriterViewModel>(builder: (context, model, child) {
      return Column(
        children: [
          SizedBox(height: 20,),
          Container(
            height: 30,
            child: Text(
                (model.writers?.length != 0)
                    ? "作家のヒット件数：${model.writers!.length.toString()}件"
                    : "作家のヒット件数：0件"
                    ,style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      );
    },
    );
  }
}