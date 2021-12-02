import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/model/city.dart';
import 'package:philippines_loan/model/menu.dart';
import 'package:philippines_loan/pages/widgets/pop_view.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/service/http_request.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import 'package:philippines_loan/utils/slog.dart';

import '../../resource.dart';

typedef onSingleSelected = Function(CityResult oneCity);

showCityPop(BuildContext context, String title, String city_id, onSingleSelected onselected,) {
  showBasePopView(
      context,
      cityPopScreen(
        title,
        city_id,
        onselected,
      ));
}

List<Widget> buildPopItem(
    List<CityResult> items, onSingleSelected onselected, CityResult? currItem) {
  Slog.d("当前选中  $currItem ");
  var widgetItems = <Widget>[];
  for (CityResult item in items) {
    bool isSelected = false;
    if (currItem != null) {
      isSelected = item.addressNo == currItem.addressNo;
    }
    widgetItems.add(GestureDetector(
      onTap: () {
        isSelected=true;

        onselected(item);
      },
      child: Column(
        children: [
          Container(
            height: 48.h,
            width: double.infinity,
            color: isSelected ? N.pinkF1 : Colors.white,
            child: Center(
              child: TextView(
                item.addressName!,
                color: isSelected ? N.red07 : N.gray6F,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(height: 1.h, color: N.pinkF1),
        ],
      ),
    ));
  }

  return widgetItems;
}

class cityPopScreen extends StatefulWidget {
  final String title;
  final String city_id;
  final onSingleSelected onselected;
  final bool isSingle;

  const cityPopScreen(this.title, this.city_id, this.onselected,
      {this.isSingle = false, Key? key})
      : super(key: key);

  @override
  _cityPopScreenState createState() => _cityPopScreenState();
}

class _cityPopScreenState extends State<cityPopScreen> {
  CityResult? oneItem;
  CityResult? twoItem;
  List<CityResult> citys = [];

  @override
  void initState() {
    super.initState();
    request(UriPath.queryRegion, {"address_no": widget.city_id }).then((value) {
      citys = City.fromJson(value).result!;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 17.h, bottom: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 14.w),
                child: TextView(
                  widget.title,
                  color: N.black33,
                ),
              ),
              GestureDetector(
                  onTap: () {
                    context.finish();
                  },
                  child: Container(
                      margin: EdgeInsets.only(right: 20.w),
                      width: 16.r,
                      height: 16.r,
                      child: Image(image: (nicon_pop_close))))
            ],
          ),
          Container(
            height: 1.h,
            color: N.pinkF1,
            margin: EdgeInsets.only(top: 17.h),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true, //防止状态溢出 自适应大小
                  children: buildPopItem(citys, (menu) {
                    oneItem = menu;
                    widget.onselected(oneItem!);
                    Future.delayed(const Duration(milliseconds: 200), () {
                      context.finish();
                    });
                    setState(() {});
                  }, oneItem),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
//普通列表选择 end =========

////双列表存档
// typedef onSelected = Function(CityResult? oneCity, CityResult? twoCity);
// typedef onSingleSelected = Function(CityResult oneCity);
//
// showCityPop(BuildContext context, String title, String city_id, onSelected onselected,{var isSingle=false}) {
//   showBasePopView(context, cityPopScreen(title, city_id, onselected,));
// }
//
// List<Widget> buildPopItem(
//     List<CityResult> items, onSingleSelected onselected, CityResult? currItem) {
//   slog.d("当前选中  $currItem ");
//   var widgetItems = <Widget>[];
//
//   for (CityResult item in items) {
//     bool isSelected = false;
//     if (currItem != null) {
//       isSelected = item.addressNo == currItem.addressNo;
//     }
//     widgetItems.add(GestureDetector(
//       onTap: () {
//         onselected(item);
//       },
//       child: Column(
//         children: [
//           Container(
//             height: 48.h,
//             width: double.infinity,
//             color: isSelected ? N.pinkF1 : Colors.white,
//             child: Center(
//               child: TextView(
//                 item.addressName!,
//                 color: isSelected ? N.red07 : N.gray6F,
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//           Container(height: 1.h, color: N.pinkF1),
//         ],
//       ),
//     ));
//   }
//
//   return widgetItems;
// }
//
// class cityPopScreen extends StatefulWidget {
//   final String title;
//   final String city_id;
//   final onSelected onselected;
//   final bool isSingle;
//
//   const cityPopScreen(this.title, this.city_id, this.onselected, {this.isSingle=false,Key? key})
//       : super(key: key);
//
//   @override
//   _cityPopScreenState createState() => _cityPopScreenState();
// }
//
// class _cityPopScreenState extends State<cityPopScreen> {
//   CityResult? oneItem;
//   CityResult? twoItem;
//    List<CityResult> citys=[];
//    List<CityResult> citys2=[];
//   var cityId = "";
//   @override
//   void initState() {
//     super.initState();
//     cityId = widget.city_id;
//
//
//     request(UriPath.queryRegion, {"address_no": cityId}).then((value) {
//       citys = City.fromJson(value).result!;
//       setState(() {});
//     });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Container(
//       padding: EdgeInsets.only(top: 17.h, bottom: 20.h),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(left: 14.w),
//                 child: TextView(
//                   widget.title,
//                   color: N.black33,
//                 ),
//               ),
//               GestureDetector(
//                   onTap: () {
//                     context.finish();
//                   },
//                   child: Container(
//                       margin: EdgeInsets.only(right: 20.w),
//                       width: 16.r,
//                       height: 16.r,
//                       child: Image(image: (nicon_pop_close))))
//             ],
//           ),
//           Container(
//             height: 1.h,
//             color: N.pinkF1,
//             margin: EdgeInsets.only(top: 17.h),
//           ),
//           Expanded(
//             child: Row(
//               children: [
//                 Expanded(
//                   child: ListView(
//                     shrinkWrap: true, //防止状态溢出 自适应大小
//                     children: buildPopItem(citys, (menu) {
//                         oneItem = menu;
//                         cityId = oneItem!.addressNo!.toString();
//
//                         if(widget.isSingle){
//                           widget.onselected(oneItem, null);
//                           Future.delayed(const Duration(milliseconds: 200), () {
//                             context.finish();
//                           });
//                         }else{
//                           request(UriPath.queryRegion, {"address_no": cityId}).then((value) {
//                             citys2 = City.fromJson(value).result!;
//                             setState(() {});
//                           });
//                         }
//
//
//
//
//
//                     }, oneItem),
//                   ),
//                 ),
//               citys2.isNotEmpty? Expanded(
//                 child: ListView(
//                       shrinkWrap: true, //防止状态溢出 自适应大小
//                       children: buildPopItem(citys2, (menu) {
//                         twoItem = menu;
//                         widget.onselected(oneItem, twoItem);
//                         Future.delayed(const Duration(milliseconds: 200), () {
//                           context.finish();
//                         });
//
//                       }, twoItem),
//                     ),
//               ):Container(),
//               ]
//
//             ),
//           )
//
//
//         ],
//       ),
//     );
//   }
// }
// //普通列表选择 end =========

//import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:philippines_loan/generated/l10n.dart';
// import 'package:philippines_loan/model/city.dart';
// import 'package:philippines_loan/model/menu.dart';
// import 'package:philippines_loan/pages/widgets/pop_view.dart';
// import 'package:philippines_loan/pages/widgets/text_view.dart';
// import 'package:philippines_loan/service/config.dart';
// import 'package:philippines_loan/service/http_request.dart';
// import 'package:philippines_loan/utils/expand_util.dart';
// import 'package:philippines_loan/utils/ncolors.dart';
// import 'package:philippines_loan/utils/slog.dart';
//
// import '../../resource.dart';
//
// typedef onSingleSelected = Function(CityResult oneCity);
//
// showCityPop(BuildContext context, String title, String city_id, onSelected onselected,{var isSingle=false}) {
//   showBasePopView(context, cityPopScreen(title, city_id, onselected,));
// }
//
// List<Widget> buildPopItem(
//     List<CityResult> items, onSingleSelected onselected, CityResult? currItem) {
//   slog.d("当前选中  $currItem ");
//   var widgetItems = <Widget>[];
//
//   for (CityResult item in items) {
//     bool isSelected = false;
//     if (currItem != null) {
//       isSelected = item.addressNo == currItem.addressNo;
//     }
//     widgetItems.add(GestureDetector(
//       onTap: () {
//         onselected(item);
//       },
//       child: Column(
//         children: [
//           Container(
//             height: 48.h,
//             width: double.infinity,
//             color: isSelected ? N.pinkF1 : Colors.white,
//             child: Center(
//               child: TextView(
//                 item.addressName!,
//                 color: isSelected ? N.red07 : N.gray6F,
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//           Container(height: 1.h, color: N.pinkF1),
//         ],
//       ),
//     ));
//   }
//
//   return widgetItems;
// }
//
// class cityPopScreen extends StatefulWidget {
//   final String title;
//   final String city_id;
//   final onSelected onselected;
//   final bool isSingle;
//
//   const cityPopScreen(this.title, this.city_id, this.onselected, {this.isSingle=false,Key? key})
//       : super(key: key);
//
//   @override
//   _cityPopScreenState createState() => _cityPopScreenState();
// }
//
// class _cityPopScreenState extends State<cityPopScreen> {
//   CityResult? oneItem;
//   CityResult? twoItem;
//    List<CityResult> citys=[];
//   var cityId = "";
//   @override
//   void initState() {
//     super.initState();
//     cityId = widget.city_id;
//
//
//     request(UriPath.queryRegion, {"address_no": cityId}).then((value) {
//       citys = City.fromJson(value).result!;
//       setState(() {});
//     });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Container(
//       padding: EdgeInsets.only(top: 17.h, bottom: 20.h),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(left: 14.w),
//                 child: TextView(
//                   widget.title,
//                   color: N.black33,
//                 ),
//               ),
//               GestureDetector(
//                   onTap: () {
//                     context.finish();
//                   },
//                   child: Container(
//                       margin: EdgeInsets.only(right: 20.w),
//                       width: 16.r,
//                       height: 16.r,
//                       child: Image(image: (nicon_pop_close))))
//             ],
//           ),
//           Container(
//             height: 1.h,
//             color: N.pinkF1,
//             margin: EdgeInsets.only(top: 17.h),
//           ),
//           Expanded(
//             child: Row(
//               children: [
//                 Expanded(
//                   child: ListView(
//                     shrinkWrap: true, //防止状态溢出 自适应大小
//                     children: buildPopItem(citys, (menu) {
//                         oneItem = menu;
//                         cityId = oneItem!.addressNo!.toString();
//
//
//                           widget.onselected(oneItem);
//                           Future.delayed(const Duration(milliseconds: 200), () {
//                             context.finish();
//                           });
//
//                     }, oneItem),
//                   ),
//                 ),
//               ]
//             ),
//           )
//
//
//         ],
//       ),
//     );
//   }
// }
// //普通列表选择 end =========
//
//
//
//
// ////普通列表选择  start =========
// // typedef onSelected = Function(CityResult? oneCity, CityResult? twoCity);
// // typedef onSingleSelected = Function(CityResult oneCity);
// //
// // showCityPop(BuildContext context, String title, String city_id, onSelected onselected,{var isSingle=false}) {
// //   showBasePopView(context, cityPopScreen(title, city_id, onselected,));
// // }
// //
// // List<Widget> buildPopItem(
// //     List<CityResult> items, onSingleSelected onselected, CityResult? currItem) {
// //   slog.d("当前选中  $currItem ");
// //   var widgetItems = <Widget>[];
// //
// //   for (CityResult item in items) {
// //     bool isSelected = false;
// //     if (currItem != null) {
// //       isSelected = item.addressNo == currItem.addressNo;
// //     }
// //     widgetItems.add(GestureDetector(
// //       onTap: () {
// //         onselected(item);
// //       },
// //       child: Column(
// //         children: [
// //           Container(
// //             height: 48.h,
// //             width: double.infinity,
// //             color: isSelected ? N.pinkF1 : Colors.white,
// //             child: Center(
// //               child: TextView(
// //                 item.addressName!,
// //                 color: isSelected ? N.red07 : N.gray6F,
// //                 textAlign: TextAlign.center,
// //               ),
// //             ),
// //           ),
// //           Container(height: 1.h, color: N.pinkF1),
// //         ],
// //       ),
// //     ));
// //   }
// //
// //   return widgetItems;
// // }
// //
// // class cityPopScreen extends StatefulWidget {
// //   final String title;
// //   final String city_id;
// //   final onSelected onselected;
// //   final bool isSingle;
// //
// //   const cityPopScreen(this.title, this.city_id, this.onselected, {this.isSingle=false,Key? key})
// //       : super(key: key);
// //
// //   @override
// //   _cityPopScreenState createState() => _cityPopScreenState();
// // }
// //
// // class _cityPopScreenState extends State<cityPopScreen> {
// //   CityResult? oneItem;
// //   CityResult? twoItem;
// //    List<CityResult> citys=[];
// //    List<CityResult> citys2=[];
// //   var cityId = "";
// //   @override
// //   void initState() {
// //     super.initState();
// //     cityId = widget.city_id;
// //
// //
// //     request(UriPath.queryRegion, {"address_no": cityId}).then((value) {
// //       citys = City.fromJson(value).result!;
// //       setState(() {});
// //     });
// //
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //
// //
// //     return Container(
// //       padding: EdgeInsets.only(top: 17.h, bottom: 20.h),
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Padding(
// //                 padding: EdgeInsets.only(left: 14.w),
// //                 child: TextView(
// //                   widget.title,
// //                   color: N.black33,
// //                 ),
// //               ),
// //               GestureDetector(
// //                   onTap: () {
// //                     context.finish();
// //                   },
// //                   child: Container(
// //                       margin: EdgeInsets.only(right: 20.w),
// //                       width: 16.r,
// //                       height: 16.r,
// //                       child: Image(image: (nicon_pop_close))))
// //             ],
// //           ),
// //           Container(
// //             height: 1.h,
// //             color: N.pinkF1,
// //             margin: EdgeInsets.only(top: 17.h),
// //           ),
// //           Expanded(
// //             child: Row(
// //               children: [
// //                 Expanded(
// //                   child: ListView(
// //                     shrinkWrap: true, //防止状态溢出 自适应大小
// //                     children: buildPopItem(citys, (menu) {
// //                         oneItem = menu;
// //                         cityId = oneItem!.addressNo!.toString();
// //
// //                         if(widget.isSingle){
// //                           widget.onselected(oneItem, null);
// //                           Future.delayed(const Duration(milliseconds: 200), () {
// //                             context.finish();
// //                           });
// //                         }else{
// //                           request(UriPath.queryRegion, {"address_no": cityId}).then((value) {
// //                             citys2 = City.fromJson(value).result!;
// //                             setState(() {});
// //                           });
// //                         }
// //
// //
// //
// //
// //
// //                     }, oneItem),
// //                   ),
// //                 ),
// //               citys2.isNotEmpty? Expanded(
// //                 child: ListView(
// //                       shrinkWrap: true, //防止状态溢出 自适应大小
// //                       children: buildPopItem(citys2, (menu) {
// //                         twoItem = menu;
// //                         widget.onselected(oneItem, twoItem);
// //                         Future.delayed(const Duration(milliseconds: 200), () {
// //                           context.finish();
// //                         });
// //
// //                       }, twoItem),
// //                     ),
// //               ):Container(),
// //               ]
// //
// //             ),
// //           )
// //
// //
// //         ],
// //       ),
// //     );
// //   }
// // }
// // //普通列表选择 end =========
