// // Used when custom error, loading states are same across app
// import 'package:flutter/material.dart';

// class AsyncValueWidget<T> extends StatelessWidget {
//   const AsyncValueWidget({Key? key, required this.value, required this.data})
//       : super(key: key);
//   final AsyncValue<T> value;
//   final Widget Function(T) data;
//   @override
//   Widget build(BuildContext context) {
//     return value.when(
//       data: data,
//       error: (e, stackTrace) => Center(child: ErrorMessageWidget(e.toString())),
//       loading: () => const Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }