package com.college.sendOTP;
import java.util.Random;
public class Otpnumber {
public  int otp() {
      Random rand1 = new Random();
         int resRandom1 = rand1.nextInt((9999 - 100) + 1) + 10;
        return resRandom1;
      }
 public static void main(String []args) {
	 System.out.println(new Otpnumber().otp());
 }
 }
   