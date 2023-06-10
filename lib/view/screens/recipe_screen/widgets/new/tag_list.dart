import 'package:flutter/material.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import 'package:what_can_i_cook/services/firebase/firestore.dart';

import '../../../../../models/tag.dart';

class TagList extends StatefulWidget {
  const TagList({super.key});

  @override
  State<TagList> createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  List existTags = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Row(
        children: [
          Text(
            "Тэги:",
            style: TextStyle(
              color: AppColors.kTextLigntColor,
              fontSize: 24,
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Tag>>(
              stream: ReadStore().readData('tags', Tag.fromJson),
              builder: (BuildContext context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                      child: Text(
                    'Нет записей',
                  ));
                } else {
                  final tags = snapshot.data!;
                  return SizedBox(
                    height: 35,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tags.length,
                        itemBuilder: (BuildContext context, int index) {
                          String widgetTag = tags[index].name;
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (!existTags.contains(widgetTag)) {
                                    existTags.add(widgetTag);
                                  } else {
                                    existTags.remove(widgetTag);
                                  }
                                  debugPrint("$existTags");
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: existTags.contains(widgetTag)
                                              ? AppColors.kPrimaryRedColor
                                              : AppColors.kTextLigntColor)),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${tags[index].name}",
                                      style: TextStyle(
                                          color: existTags.contains(widgetTag)
                                              ? AppColors.kPrimaryRedColor
                                              : AppColors.kTextLigntColor),
                                    ),
                                  ))),
                            ),
                          );
                        }),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
