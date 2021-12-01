
//自定义Dialog
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/model/menu.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/utils/ncolors.dart';

import 'button_view.dart';

class DialogWidget extends Dialog {
  final Widget content; //内容
  double heightSize;

  DialogWidget({
    Key? key,
    required this.content,
    this.heightSize = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 335.w,
        height: heightSize.h,
        decoration: BoxDecoration(
            color: getPrimaryColor(context),
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        child: Padding(
          padding: EdgeInsets.all(30.r),
          child: content,
        ),
      ),
    );
  }
}

void showMyDialog(BuildContext myContext, Widget widget, {double heightSize = 200}) {
  showDialog(
      context: myContext,
      barrierDismissible:false,
      builder: (myContext) {
        return Column(
          children: [
            Expanded(
              child: DialogWidget(
                content: widget,
                heightSize: heightSize,
              ),
            ),
          ],
        );
      });
}

void showSimpleDialog(BuildContext myContext, String title, AssetImage img,
    VoidCallback confirmFun) {
  var simpleDialog = Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.r,

          decoration: TextDecoration.none,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top:30.r),
        child: Container(
            width: 118.w,
            height: 130.h,
            child: Image(image: img)),
      ),
      ButtonView(S.current.iknow, confirmFun)
    ],
  );

  showMyDialog(myContext, simpleDialog,heightSize: 500.h);
}



void showTextDialog(BuildContext myContext, String text,
    VoidCallback confirmFun) {
  var simpleDialog = Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Padding(
        padding:  EdgeInsets.only(bottom: 50.h),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.r,

            decoration: TextDecoration.none,
          ),
        ),
      ),
      Container(
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {

                Navigator.pop(myContext);

                },
              child: TextView(
                S.current.cancel,

              ),
            ),
            Container(

              alignment: Alignment.center,
              child: SizedBox(
                width: 200.w,
                height: 46.h,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    confirmFun();

                  },
                  child: Text(
                    S.current.ok,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.r),
                  ),
                ),
              ),
            )
          ],
        ),
      ),

    ],
  );

  showMyDialog(myContext, simpleDialog);
}




typedef onDialogClick = Function(MenuItem menu);
//显示列表选择
// void showListDialog(
//     BuildContext myContext, String title, List<MenuItem> lists, onDialogClick,{bool center=false}) {
//     Widget dialogView = _dialogViewWidget(myContext, title, lists, onDialogClick,isCenter:center);
//     showMyDialog(myContext, dialogView, heightSize: 330);
// }



// class _dialogViewWidget extends StatefulWidget {
//   final BuildContext myContext;
//   final String title;
//    bool isCenter;
//   final List<MenuItem> lists;
//   final onDialogClick;
//
//
//    _dialogViewWidget(this.myContext, this.title, this.lists, this.onDialogClick,{this.isCenter=false});
//
//   @override
//   State<_dialogViewWidget> createState() => _dialogViewWidgetState();
// }
//
// class _dialogViewWidgetState extends State<_dialogViewWidget> {
//   int currPosition = 0;
//   MenuItem? currMenu;
//
//   @override
//   void initState() {
//     super.initState();
//
//     if(widget.lists.isNotEmpty){
//       currMenu=widget.lists.first;
//     }
//
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Text(widget.title, style:  TextStyle(fontSize:14.r,fontWeight: FontWeight.bold),),
//           Container(
//             margin: EdgeInsets.only(top: 12.h),
//             width: double.infinity,
//             height: 0.5.h,
//
//           ),
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
//               child: CupertinoPicker(
//                 squeeze: 1,
//                 useMagnifier: true,
//                 itemExtent: 40.h,
//                 onSelectedItemChanged: (position) {
//                   currMenu =  widget.lists[position];
//                   currPosition = position;
//                   setState(() { });
//                 },
//                 children: _buildMenuItem( widget.lists, currPosition,widget.isCenter),
//               ),
//             ),
//           ),
//           Container(
//             height: 50.h,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text(
//                     S.current.cancel,
//                     style: TextStyle(color: N.gray98, fontSize: 20.r),
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                       gradient: N.lg_bg,
//                       borderRadius: BorderRadius.circular(26)),
//                   alignment: Alignment.center,
//                   child: SizedBox(
//                     width: 200.w,
//                     height: 46.r,
//                     child: TextButton(
//                       style: ButtonStyle(
//                         backgroundColor:
//                         MaterialStateProperty.all(Colors.transparent),
//                       ),
//                       onPressed: () {
//                         Navigator.pop(context);
//
//                         if(widget.lists.isNotEmpty&&currMenu==null){
//                           currMenu=widget.lists.first;
//                         }
//                         widget.onDialogClick(currMenu);
//
//                       },
//                       child: Text(
//                         S.current.ok,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20.r),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//
//   }
// }
//
// _buildMenuItem(List<MenuItem> lists, int currPosition,bool center) {
//   var list = <Widget>[];
//   for (int index = 0; index < lists.length; index++) {
//     list.add(_buildItemViewWidget(value: lists[index],isCenter: center, isSelected: (currPosition == index)));
//   }
//   return list;
// }
//
// class _buildItemViewWidget extends StatefulWidget {
//   const _buildItemViewWidget({
//     Key? key,
//     required this.value,
//     required this.isSelected,
//     this.isCenter=false,
//   }) : super(key: key);
//
//   final MenuItem value;
//   final bool isSelected;
//   final bool isCenter;
//
//   @override
//   State<_buildItemViewWidget> createState() => _buildItemViewWidgetState();
// }
//
// class _buildItemViewWidgetState extends State<_buildItemViewWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
// mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         widget.value.imageUri == null ? Container() : Container(
//           width: 25.r,
//           height: 25.r,
//           margin: EdgeInsets.only(right: 12.w),
//           child: Image.network(
//               widget.value.imageUri!),
//         ),
//         Text(widget.value.menuName,
//             style: TextStyle(
//               color: widget.isSelected ? N.pinkff : N.gray98,
//             ))
//       ],
//
//     );
//   }
// }
//
//
//
// void showPPDialog(BuildContext myContext,
//     VoidCallback confirmFun,VoidCallback cancelFun) {
//
//
//   showDialog(
//       context: myContext,
//       barrierDismissible:false,
//       builder: (myContext) {
//         return    Center(
//           child: Container(
//             width: 335.w,
//             decoration: BoxDecoration(
//                 color: getPrimaryColor(myContext),
//                 borderRadius: BorderRadius.all(Radius.circular(12.r))),
//             child: Padding(
//               padding: EdgeInsets.all(30.r),
//               child: Container(
//                 child:
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text("${S.current.pp_tip1}\n${HttpConfig.baseURL}",style: TextStyle(fontSize: 14.r,color: N.gray48,fontWeight: FontWeight.bold,),),
//                  Container(height: 11.h,),
//                     Text(S.current.pp_tip2,style: TextStyle(fontSize: 14.r,color: N.gray48,fontWeight: FontWeight.bold,),),
//                     Container(height: 6.h,),
//                     Text(S.current.pp_tip3,style: TextStyle(fontSize: 14.r,color: N.meetff,fontWeight: FontWeight.bold,),),
//                     Container(height: 6.h,),
//                     Text(S.current.pp_tip4,style: TextStyle(fontSize: 14.r,color: N.meetff,fontWeight: FontWeight.bold,),),
//                     Container(height: 6.h,),
//                     Text(S.current.pp_tip5,style: TextStyle(fontSize: 14.r,color: N.meetff,fontWeight: FontWeight.bold,),),
//                     Container(height: 12.h,),
//                     Text(S.current.pp_tip6,style: TextStyle(fontSize: 14.r,),),
//                     Container(height: 20.h,),
//                     Container(
//                       height: 50.h,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           GestureDetector(
//                             onTap:  cancelFun,
//                             child: Text(
//                               S.current.cancel,
//                               style: TextStyle(color: N.gray98, fontSize: 20.r),
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 gradient: N.lg_bg,
//                                 borderRadius: BorderRadius.circular(26)),
//                             alignment: Alignment.center,
//                             child: SizedBox(
//                               width: 200.w,
//                               height: 46.r,
//                               child: TextButton(
//                                 style: ButtonStyle(
//                                   backgroundColor:
//                                   MaterialStateProperty.all(Colors.transparent),
//                                 ),
//                                 onPressed: confirmFun,
//                                 child: Text(
//                                   S.current.ok,
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20.r),
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//
//
//
//       }
// );
//
//
//
// }
//
