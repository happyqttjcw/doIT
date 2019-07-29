package security;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.security.spec.AlgorithmParameterSpec;

import javax.crypto.Cipher;
import javax.crypto.CipherOutputStream;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class CipherUtil {
    private static byte[] randomKey;
    //�ʱ�ȭ ���� : iv
    private final static byte[] iv = new byte[] {
          (byte)0x8E,0x12,0x39,(byte)0x9C,
                0x07,0x72,0x6F,(byte)0x5A,
          (byte)0x8E,0x12,0x39,(byte)0x9C,
                0x07,0x72,0x6F,(byte)0x5A};
       static Cipher cipher;
       static {
          try {
             cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
          } catch (Exception e) {
             e.printStackTrace();
          }
    }
       
    public static byte[] getRandomKey(String algo) throws NoSuchAlgorithmException {
       KeyGenerator keyGen = KeyGenerator.getInstance(algo);
       keyGen.init(128); //128bit�� Ű�� ����.
       SecretKey key = keyGen.generateKey();
       return key.getEncoded();
    }
    
    public static String encrypt(String plain, String key) {
    	byte[] cipherMsg = new byte[1024];
    	try {
    		Key genKey = new SecretKeySpec(makeKey(key),"AES");
    		AlgorithmParameterSpec paramSpec = new IvParameterSpec(iv);
    		cipher.init(Cipher.ENCRYPT_MODE, genKey, paramSpec);
    		cipherMsg = cipher.doFinal(plain.getBytes());
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return byteToHex(cipherMsg);
    }
    
    private static byte[] makeKey(String key) {
		int len = key.length();
		char ch = 'A';
		for(int i=len;i<16;i++) key += ch++;
		return key.substring(0,16).getBytes();
	}
    
    private static String byteToHex(byte[] cipherMsg) {
       if(cipherMsg == null ) return null;
       String str = "";
       for(byte b : cipherMsg) {
          str += String.format("%02X", b);
       }
       return str;
    }
    
    public static String decrypt(String cipherMsg) {
       byte[] plainMsg = new byte[1024];
       try {
          Key key = new SecretKeySpec(randomKey,"AES");
          AlgorithmParameterSpec paramSpec = new IvParameterSpec(iv);
          //��ȣȭ ���� ��ȣȭ ��ü �ʱ�ȭ
          cipher.init(Cipher.DECRYPT_MODE,key,paramSpec);
          plainMsg = cipher.doFinal(hexToByte(cipherMsg.trim()));
       } catch (Exception e) {
          e.printStackTrace();
       }
       return new String(plainMsg).trim();
    }
    
    public static String decrypt(String cipher1, String key) {
    	byte[] plainMsg = new byte[1024];
    	try {
    		Key genKey = new SecretKeySpec(makeKey(key),"AES");
    		AlgorithmParameterSpec paramSpec = new IvParameterSpec(iv);
    		cipher.init(Cipher.DECRYPT_MODE, genKey, paramSpec);
    		plainMsg = cipher.doFinal(hexToByte(cipher1));
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	return new String(plainMsg).trim();
    }
    private static byte[] hexToByte(String str) {
       if(str == null) return null;
       if(str.length() < 2) return null;
       int len = str.length()/2;
       byte[] buf = new byte[len];
       for(int i=0; i<len; i++) {
          buf[i] = (byte)Integer.parseInt(str.substring(i*2,i*2+2),16);
       }
       return buf;
    }
	public static void encryptFile(String plainFile, String cipherFile, String strkey) {
		try {
			getKey(strkey);
			ObjectInputStream ois = new ObjectInputStream(new FileInputStream("key.ser"));
			Key key = (Key)ois.readObject();
			ois.close();
			AlgorithmParameterSpec paramSpec = new IvParameterSpec(iv);
			cipher.init(Cipher.ENCRYPT_MODE, key, paramSpec);
			FileInputStream fis = new FileInputStream(plainFile);
			FileOutputStream fos = new FileOutputStream(cipherFile);
			CipherOutputStream cos = new CipherOutputStream(fos, cipher);
			byte[] buf = new byte[1024];
			int len;
			while((len=fis.read(buf)) != -1) {
				cos.write(buf, 0, len);
			}
			fis.close(); cos.close(); fos.flush(); cos.close(); fos.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	private static void getKey(String key) throws Exception	 {
		Key genkey = new SecretKeySpec(makeKey(key),"AES");
		ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream("key.ser"));
		out.writeObject(genkey);
		out.flush(); out.close();
	}
	public static void decryptFile(String cipherFile, String plainFile) {
		try {
			ObjectInputStream ois = new ObjectInputStream(new FileInputStream("key.ser"));
			Key key = (Key)ois.readObject();
			ois.close();
			AlgorithmParameterSpec paramSpec = new IvParameterSpec(iv);
			cipher.init(Cipher.DECRYPT_MODE, key, paramSpec);
			FileInputStream fis = new FileInputStream(cipherFile);
			FileOutputStream fos = new FileOutputStream(plainFile);
			CipherOutputStream cos = new CipherOutputStream(fos, cipher);
			byte[] buf = new byte[1024];
			int len;
			while((len=fis.read(buf)) != -1) {
				cos.write(buf, 0, len);
			}
			fis.close(); cos.close(); fos.flush(); cos.close(); fos.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
 }