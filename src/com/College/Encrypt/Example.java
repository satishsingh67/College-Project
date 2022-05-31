package com.college.Encrypt;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Base64;
import java.util.Random;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class Example {
	  /* Declaration of variables */   
  private static SecretKeySpec secretKey;
  private static byte[] key;
  private static final Random random = new SecureRandom();  
  private static final String characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";  
  private static final int iterations = 10000;  
  private static final int keylength = 256;  
  /* Method to generate the salt value. */  
  public static String getSaltvalue(int length)   
  {  
      StringBuilder finalval = new StringBuilder(length);  

      for (int i = 0; i < length; i++)   
      {  
          finalval.append(characters.charAt(random.nextInt(characters.length())));  
      }  

      return new String(finalval);  
  }    
  public static void setKey(final String myKey) {
    MessageDigest sha = null;
    try {
      key = myKey.getBytes("UTF-8");
      sha = MessageDigest.getInstance("SHA-1");
      key = sha.digest(key);
      key = Arrays.copyOf(key, 16);
      secretKey = new SecretKeySpec(key, "AES");
    } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
      e.printStackTrace();
    }
  }
  /* Method to verify if both password matches or not */  
  public static boolean verifyUserPassword(String providedPassword,  
          String securedPassword, String salt)  
  {  
      boolean finalval = false;  
        
      /* Generate New secure password with the same salt */  
      String newSecurePassword = encrypt(providedPassword, salt);  
        
      /* Check if two passwords are equal */  
      finalval = newSecurePassword.equalsIgnoreCase(securedPassword);  
        
      return finalval;  
  } 
  public static String encrypt(final String strToEncrypt, final String secret) {
    try {
      setKey(secret);
      Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
      cipher.init(Cipher.ENCRYPT_MODE, secretKey);
      return Base64.getEncoder()
        .encodeToString(cipher.doFinal(strToEncrypt.getBytes("UTF-8")));
    } catch (Exception e) {
      System.out.println("Error while encrypting: " + e.toString());
    }
    return null;
  }

  public static String decrypt(final String strToDecrypt, final String secret) {
    try {
      setKey(secret);
      Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
      cipher.init(Cipher.DECRYPT_MODE, secretKey);
      return new String(cipher.doFinal(Base64.getDecoder()
        .decode(strToDecrypt)));
    } catch (Exception e) {
      System.out.println("Error while decrypting: " + e.toString());
    }
    return null;
  }
  
  public static void main(final String[] args) {
    final String secretKey = Example.getSaltvalue(20);

    String originalString = "satish";
    String encryptedString = Example.encrypt(originalString, secretKey) ;
   // String decryptedString = Example.decrypt(encryptedString, secretKey) ;

    String a="bzqkdpWRQQ9ihvj1r+WGUg==";
    String b="Zu7qq1F6kDXeu35M0lHG";
    String decryptedString = Example.decrypt(a, b) ;
    boolean status=Example.verifyUserPassword("satish", encryptedString, secretKey);
    System.out.println(status);
    
    System.out.println(originalString);
    System.out.println(encryptedString);
    System.out.println(decryptedString);
    
    System.out.println(secretKey);
  }
}