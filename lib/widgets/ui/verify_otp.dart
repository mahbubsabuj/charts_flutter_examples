import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({Key? key}) : super(key: key);

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  OtpFieldController otpController = OtpFieldController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade50,
        // backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () => {},
            child: Text(
              "Log in Instead",
              style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue.shade500),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
        child: Column(
          children: [
            const Center(
              child: Text(
                "Verify Your Email",
                style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 25.01,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Text(
                "We have sent you a four-digit code in your email. Enter the code to continue.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            // OTPTextField(
            //   controller: otpController,
            //   length: 4,
            //   width: MediaQuery.of(context).size.width,
            //   otpFieldStyle: OtpFieldStyle(
            //       borderColor: Colors.blue.shade500,
            //       enabledBorderColor: Colors.blue.shade500),
            //   textFieldAlignment: MainAxisAlignment.spaceAround,
            //   fieldWidth: 79.5,
            //   fieldStyle: FieldStyle.box,
            //   outlineBorderRadius: 5,
            //   style: const TextStyle(
            //       fontFamily: 'Helvetica Neue',
            //       fontSize: 20,
            //       fontWeight: FontWeight.w500),
            //   onChanged: (pin) {
            //     if (kDebugMode) {
            //       print("Changed: $pin");
            //     }
            //   },
            //   onCompleted: (pin) {
            //     if (kDebugMode) {
            //       print("Completed: $pin");
            //     }
            //   },
            // ),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 56,
                    width: 79.5,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue.shade500, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue.shade500, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue.shade500, width: 1),
                        ),
                      ),
                      onChanged: (value) => {
                        if (value.length == 1)
                          {
                            FocusScope.of(context).nextFocus(),
                          }
                      },
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 56,
                    width: 79.5,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue.shade500, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue.shade500, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue.shade500, width: 1),
                        ),
                      ),
                      onChanged: (value) => {
                        if (value.length == 1)
                          {
                            FocusScope.of(context).nextFocus(),
                          }
                        else
                          {
                            FocusScope.of(context).previousFocus(),
                          }
                      },
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 56,
                    width: 79.5,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue.shade500, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue.shade500, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue.shade500, width: 1),
                        ),
                      ),
                      onChanged: (value) => {
                        if (value.length == 1)
                          {
                            FocusScope.of(context).nextFocus(),
                          }
                        else
                          {
                            FocusScope.of(context).previousFocus(),
                          }
                      },
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 56,
                    width: 79.5,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue.shade500, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue.shade500, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue.shade500, width: 1),
                        ),
                      ),
                      onChanged: (value) => {
                        if (value.length == 0)
                          {
                            FocusScope.of(context).previousFocus(),
                          }
                      },
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
