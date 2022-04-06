package com.college.model;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PublicKey;
import java.security.Signature;
import java.time.Instant;
import java.time.OffsetDateTime;
import java.util.Date;

import javax.crypto.Cipher;
public class Encrypt {

   public static void main(String args[]) throws Exception{
	 String d="2022-03-04T21:04";
	 OffsetDateTime odt = OffsetDateTime.parse(d);
     System.out.println(odt);

     // Convert OffsetDateTime into Instant
     Instant instant = odt.toInstant();

     // If at all, you need java.util.Date
     Date date = Date.from(instant);
     System.out.println(date);
   }
}