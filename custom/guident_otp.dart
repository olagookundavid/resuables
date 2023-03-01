import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _controllerOtp1 = TextEditingController();
  final TextEditingController _controllerOtp2 = TextEditingController();
  final TextEditingController _controllerOtp3 = TextEditingController();
  final TextEditingController _controllerOtp4 = TextEditingController();
  final TextEditingController _controllerOtp5 = TextEditingController();
  final TextEditingController _controllerOtp6 = TextEditingController();

  FocusNode otpFocusNode1 = FocusNode();
  FocusNode otpFocusNode2 = FocusNode();
  FocusNode otpFocusNode3 = FocusNode();
  FocusNode otpFocusNode4 = FocusNode();
  FocusNode otpFocusNode5 = FocusNode();
  FocusNode otpFocusNode6 = FocusNode();

  late Timer _timer;
  int _start = 45;
  bool canResendOtp = false;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controllerOtp1.dispose();
    _controllerOtp2.dispose();
    _controllerOtp3.dispose();
    _controllerOtp4.dispose();
    _controllerOtp5.dispose();
    _controllerOtp6.dispose();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          canResendOtp = true;
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Scaffold(
            body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text('OTP Verification'),
                const SizedBox(
                  height: 30,
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Enter the one time password sent to\n',
                        style: TextStyle(
                          // fontSize: textMedium,
                          // color: kTextGrey,
                          fontFamily: 'Product_sans',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: '+2347054800759',
                        style: TextStyle(
                          fontFamily: 'Product_sans',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildOTPBoxes(_controllerOtp1, 60, 50, 20, 16, 1,
                        otpFocusNode1, otpFocusNode2, otpFocusNode1, context),
                    buildOTPBoxes(_controllerOtp2, 60, 50, 20, 16, 1,
                        otpFocusNode2, otpFocusNode3, otpFocusNode1, context),
                    buildOTPBoxes(_controllerOtp3, 60, 50, 20, 16, 1,
                        otpFocusNode3, otpFocusNode4, otpFocusNode2, context),
                    buildOTPBoxes(_controllerOtp4, 60, 50, 20, 16, 1,
                        otpFocusNode4, otpFocusNode5, otpFocusNode3, context),
                    buildOTPBoxes(_controllerOtp5, 60, 50, 20, 16, 1,
                        otpFocusNode5, otpFocusNode6, otpFocusNode4, context),
                    buildOTPBoxes(_controllerOtp6, 60, 50, 20, 16, 1,
                        otpFocusNode6, otpFocusNode6, otpFocusNode5, context),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                        text: 'Didn\'t get the code? Resend in ',
                        style: TextStyle(
                          fontFamily: 'Product_sans',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: '00:$_start',
                        style: const TextStyle(
                          fontFamily: 'Product_sans',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: SizedBox(
                    width: width,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xff1A8FE3)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text('Verify'),
                        )),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}

SizedBox buildOTPBoxes(
    TextEditingController controller,
    double height,
    double width,
    double fontSize,
    double hintFontSize,
    int textInputLimit,
    FocusNode currentFocusNode,
    FocusNode nextFocusNode,
    FocusNode previousNode,
    BuildContext context) {
  return SizedBox(
    width: width,
    height: height,
    child: TextFormField(
      onChanged: (val) {
        val.isNotEmpty
            ? FocusScope.of(context).requestFocus(nextFocusNode)
            : FocusScope.of(context).requestFocus(previousNode);
      },
      keyboardType: TextInputType.number,
      controller: controller,
      cursorColor: Colors.black,
      focusNode: currentFocusNode,
      textAlign: TextAlign.center,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(textInputLimit),
      ],
      style: TextStyle(
        fontSize: fontSize,
        // color: kBlackColor,
        fontFamily: 'Ubuntu',
      ),
      validator: (val) => val!.isEmpty ? 'x' : null,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1),
        ),
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: hintFontSize,
          fontFamily: 'Ubuntu',
        ),
      ),
    ),
  );
}
