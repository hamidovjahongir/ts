import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ts/core/utils/images.dart';
import 'package:ts/core/widgets/my_button.dart';
import 'package:ts/features/spalsh/presentation/pages/Login_splash_screen.dart';

class AgreeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.image1),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                children: [
                  SizedBox(height: 40),

                  Text(
                    'TopStretching',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),

                  Text(
                    'Yoga and Exercise',
                    style: GoogleFonts.openSans(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),

                  Spacer(),

                  Text(
                    'START PRACTICING\nTHE BEST WORKOUT PROGRAMS\nBASED ON YOUR GOALS',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                  ),

                  SizedBox(height: 40),

                  CheckboxListTile(
                    title: Text(
                      'I agree to the processing of my personal data according to Privacy Policy (including, to sharing my personal data with third parties)',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    value: false,
                    onChanged: (value) {},
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.orange,
                  ),

                  CheckboxListTile(
                    title: Text(
                      'I accept the Terms and Conditions of Use',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    value: false,
                    onChanged: (value) {},
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.orange,
                  ),

                  SizedBox(height: 30),

                  MyButtom(
                    color: Colors.grey.shade600,
                    title: "CONTINUE",
                    value: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (x) => Screen()),
                      );
                      
                    },
                    
                    textColor: Colors.white,
                    height: 60,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'By tapping Continue you agree to the Privacy Policy and Terms and Conditions of Use',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: Colors.white70,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
