package com.etran.utils;

import java.security.Key;

import javax.crypto.Cipher;

public class CipherUtils {

	public static Cipher initCipher(Key key, int mode) throws Exception {
		String algorithm = key.getAlgorithm();
		return initCipher(key, mode, algorithm);
	}

	public static Cipher initCipher(Key key, int mode, String algorithm) throws Exception {
		Cipher cipher = Cipher.getInstance(algorithm);
		cipher.init(mode, key);
		return cipher;
	}

	public static byte[] crypt(byte[] data, Key key, int mode, String algorithm) throws Exception {
		Cipher cipher = initCipher(key, mode, algorithm);
		return crypt(cipher, data);
	}

	public static byte[] crypt(byte[] data, Key key, int mode) throws Exception {
		Cipher cipher = initCipher(key, mode);
		return crypt(cipher, data);
	}

	public static byte[] crypt(Cipher cipher, byte[] data) throws Exception {
		byte[] cipherText = cipher.doFinal(data);
		return cipherText;
	}

}
