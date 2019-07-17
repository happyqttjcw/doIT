package security;

import java.security.Key;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.AlgorithmParameterSpec;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

public class CipherUtil {
	private static byte[] randomKey;
	private final static byte[] iv = new byte[] { (byte) 0x8E, 0x12, 0x39, (byte) 0x9C, 0x07, 0x72, 0x6F, (byte) 0x5A,
			(byte) 0x8E, 0x12, 0x39, (byte) 0x9C, 0x07, 0x72, 0x6F, (byte) 0x5A };
	static AlgorithmParameterSpec paramSpec = new IvParameterSpec(iv);
	static Cipher cipher;
	static {
		try {
			cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static String encrypt(String plain, String password) {
		byte[] cipherMsg = new byte[1024];
		try {
			Key genKey = new SecretKeySpec(password.substring(0, 16).getBytes(), "AES");
			AlgorithmParameterSpec paramSpec = new IvParameterSpec(iv);
			cipher.init(Cipher.ENCRYPT_MODE, genKey, paramSpec);
			cipherMsg = cipher.doFinal(plain.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return byteToHex(cipherMsg);
	}

	private static String byteToHex(byte[] cipherMsg) {
		if (cipherMsg == null)
			return null;
		String str = "";
		for (byte b : cipherMsg) {
			str += String.format("%02X", b);
		}
		return str;
	}

	public static String messageDigest(String password) {
		byte[] plain = password.getBytes();
		byte[] hash = null;
		String result = "";
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-256");
			hash = md.digest(plain); // 해쉬암호 생성

			for (byte b : hash) {
				result += String.format("%02X", b);
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return result;
	}

	public static String decript(String email, String password) {
		byte[] plainMsg = new byte[1024];
		try {
			Key genKey = new SecretKeySpec(password.substring(0, 16).getBytes(), "AES");
			cipher.init(Cipher.DECRYPT_MODE, genKey, paramSpec);
			plainMsg = cipher.doFinal(hexToByte(email.trim()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new String(plainMsg).trim();
	}

	private static byte[] hexToByte(String str) {
		if (str == null)
			return null;
		if (str.length() < 2)
			return null;
		int len = str.length() / 2;
		byte[] buf = new byte[len];
		for (int i = 0; i < len; i++) {
			buf[i] = (byte) Integer.parseInt(str.substring(i * 2, i * 2 + 2), 16);
		}
		return buf;
	}

}
