

import 'package:mvvm_example/core/extentions.dart';

class AppInputValidation{


   static String? validateEmail(String? val){

        if(val!.isEmpty){
          return 'Email required';
        }
        if(!val.isValidEmail()){
          return 'Enter valid email address';
        }
          return null;
    }


    static String? validatePassword(String? val){

        if(val!.isEmpty){
          return 'password required';
        }
        if(val.length < 8){
          return 'password must need 8 characters';
        }
        return null;
     }

   static String? validateConfirmPassword(String oldPwd,String? val){

       if(val!.isEmpty){
         return 'password required';
       }
       if(val.length < 8){
         return 'password must need 8 characters';
       }
       if(val != oldPwd){
         return 'Confirm password not match';
       }
        return null;
   }





}