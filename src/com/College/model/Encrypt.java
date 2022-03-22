package com.college.model;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PublicKey;
import java.security.Signature;

import javax.crypto.Cipher;
public class Encrypt {

   public static void main(String args[]) throws Exception{
	 
	   String s="sssss.ddd";
	  String []a=s.split("\\.");
	  System.out.println(a[0]+" "+a[1]+ a.length); 
	  
   }
}