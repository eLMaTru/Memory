package com.afm.util;

import java.security.MessageDigest;
import java.util.Arrays;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
@Component
public class MailSend {
   
	static String secretKey = "memorykey";
 
 public void sendMail(JavaMailSender mailSender, String email){
	 SimpleMailMessage mail = new SimpleMailMessage();
	 mail.setTo(email);
	 mail.setSubject("Welcome to Memory!");
	 mail.setText("Thank for join with us.");

	 mailSender.send(mail);
 }

 public void sendMailforgot(JavaMailSender mailSender, String email){
	 SimpleMailMessage mail = new SimpleMailMessage();
	 String m = Encriptar("matru "+email);
	 mail.setTo(email);
	 mail.setSubject("Memory - Getting a new password!");
	 mail.setText("Click en el link para obtener una nueva contrasena. http://memory.j.facilcloud.com/Memory/get-new-password.html?"
	 		+ "Xd=kl@/KLSERooEoohhhg/ggWEVEYK/JRVRCESA/SVRYTUJAWEV/RYTUNYJUK/0/ddfsdffgrgt&WMW="+m+"");

	 mailSender.send(mail);
 }
 
 
 public boolean isNumeric(String cadena){
	 try {
		 Long.parseLong(cadena);
	  return true;
	 } catch (NumberFormatException nfe){
	  return false;
	 }
	}
 
 public static String Encriptar(String texto) {
	 
     String base64EncryptedString = "";

     try {

         MessageDigest md = MessageDigest.getInstance("MD5");
         byte[] digestOfPassword = md.digest(secretKey.getBytes("utf-8"));
         byte[] keyBytes = Arrays.copyOf(digestOfPassword, 24);

         SecretKey key = new SecretKeySpec(keyBytes, "DESede");
         Cipher cipher = Cipher.getInstance("DESede");
         cipher.init(Cipher.ENCRYPT_MODE, key);

         byte[] plainTextBytes = texto.getBytes("utf-8");
         byte[] buf = cipher.doFinal(plainTextBytes);
         byte[] base64Bytes = Base64.encodeBase64(buf);
         base64EncryptedString = new String(base64Bytes);

     } catch (Exception ex) {
     }
     return base64EncryptedString;
}
 
 public static String Desencriptar(String textoEncriptado) throws Exception {
	 
     String base64EncryptedString = "";

     try {
         byte[] message = Base64.decodeBase64(textoEncriptado.getBytes("utf-8"));
         MessageDigest md = MessageDigest.getInstance("MD5");
         byte[] digestOfPassword = md.digest(secretKey.getBytes("utf-8"));
         byte[] keyBytes = Arrays.copyOf(digestOfPassword, 24);
         SecretKey key = new SecretKeySpec(keyBytes, "DESede");

         Cipher decipher = Cipher.getInstance("DESede");
         decipher.init(Cipher.DECRYPT_MODE, key);

         byte[] plainText = decipher.doFinal(message);

         base64EncryptedString = new String(plainText, "UTF-8");

     } catch (Exception ex) {
     }
     return base64EncryptedString;
}
 
 
}