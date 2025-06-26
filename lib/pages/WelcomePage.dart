import 'package:balanced_meal/components/navigate_animation.dart';
import 'package:balanced_meal/components/primary_button.dart';
import 'package:balanced_meal/pages/details.dart';
import 'package:balanced_meal/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  void handleOrderFood (){
    Navigator.push(context, SlidePageRoute(page: EnterDetailsPage()));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Container(
          height: 100.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal:6.67.w ),
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/1_ Welcome screen.png' ),
              fit: BoxFit.cover

            )
          ),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 6.h),

              Text(
                'Balanced Meal',
                style: GoogleFonts.abhayaLibre(
                  fontWeight: FontWeight.w800,
                  fontSize: 22.sp,
                  height: 1,
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Text(
                'Craft your ideal meal effortlessly with our app. Select nutritious ingredients tailored to your taste and well-being.',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  fontSize: 12.sp,
                  height: 1.4,
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 3.75.h,),

              PrimaryButton(text: 'Order Food', onPressed: handleOrderFood),
              SizedBox(height: 6.h),

            ],

          ),
        )
      ))

    );
  }
}
