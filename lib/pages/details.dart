import 'package:balanced_meal/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/custom_dropdown.dart';
import '../components/custom_input.dart';



class EnterDetailsPage extends StatefulWidget {
  const EnterDetailsPage({super.key});

  @override
  State<EnterDetailsPage> createState() => _EnterDetailsPageState();
}

class _EnterDetailsPageState extends State<EnterDetailsPage> {
  @override
  Widget build(BuildContext context) {
    String selectedGender = '';
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
            title: Text(
              'Enter your details',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.67.w, vertical: 3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // GENDER

                 CustomDropdownField<String>(
                  label: 'Gender',
                  value: selectedGender,
                  hint: 'Choose your gender',
                  items: ['Male', 'Female'].map((gender) {
                    return DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedGender = val!;
                    });
                  },
                ),

                SizedBox(height: 3.h),

                // HEIGHT

                CustomInputField(
                  label: 'Weight',
                  hint: 'Enter your Weight',
                  suffix: Text('Kg'),
                ),

                SizedBox(height: 3.h),

                // HEIGHT

                 CustomInputField(
                  label: 'Height',
                  hint: 'Enter your height',
                  suffix: Text('Cm'),
                ),


                SizedBox(height: 3.h),

                // HEIGHT

                CustomInputField(
                  label: 'Age',
                  hint: 'Enter your age',
                  
                ),

                const Spacer(),

                // DISABLED BUTTON
                PrimaryButton(text: 'Next', onPressed: (){}),

              ],
            ),
          ),
        );
      },
    );
  }
}
