import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/walk_widget.dart';

// Focus widget keys for this walkthrough
final containerT2laecnl = GlobalKey();
final textFieldCh5vnt2j = GlobalKey();
final textFieldB8gqurx7 = GlobalKey();
final dropDown1460atnk = GlobalKey();
final dropDownKuc265ug = GlobalKey();
final dropDownC6sufcw1 = GlobalKey();
final dropDownPz6w56fv = GlobalKey();
final dropDownTt1r4ye4 = GlobalKey();
final textFieldK0ygfipj = GlobalKey();

/// from
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: containerT2laecnl,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkWidget(
              text: 'Inta tabo sad profile ka sawir u sarato',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: textFieldCh5vnt2j,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkWidget(
              text: 'Username Kaga Inta Ku qor',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: textFieldB8gqurx7,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkWidget(
              text: 'Magacada O Sadaxan Inta Ku Qor',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: dropDown1460atnk,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkWidget(
              text: 'Da,da Jirtid Inta Ka Doro',
            ),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: dropDownKuc265ug,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkWidget(
              text: 'Rag Ama Dumar Midka Tahay Inta Ka Doro',
            ),
          ),
        ],
      ),

      /// Step 6
      TargetFocus(
        keyTarget: dropDownC6sufcw1,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkWidget(
              text: 'hadi ad shaqeysid ama adan shaqeyn inta ka doro',
            ),
          ),
        ],
      ),

      /// Step 7
      TargetFocus(
        keyTarget: dropDownPz6w56fv,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkWidget(
              text: 'Midibka tahy inta ka doro',
            ),
          ),
        ],
      ),

      /// Step 8
      TargetFocus(
        keyTarget: dropDownTt1r4ye4,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkWidget(
              text: 'Hadi ad horay gur uso marty ama adan somarin inta ka doro',
            ),
          ),
        ],
      ),

      /// Step 9
      TargetFocus(
        keyTarget: textFieldK0ygfipj,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkWidget(
              text: 'Wax adi kugu sabsan ama ad ama naftada',
            ),
          ),
        ],
      ),
    ];
