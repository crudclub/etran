package com.etran.utils;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * AES128加密算法是一种对称加密算法，其中KEY是对称算法核心秘钥<br/>
 * 通过key即可生成SecretKey(参见<code>com.apps.utils.AES128ECB.keyGen(String)</code>)<br/>
 *
 * @author Icarus
 *
 */
public class AES128ECB {

	public static final String KEY1 = "ynet.runtime4799";
	public static final String KEY2 = "com.ynet.www.runtime.2018.$&$*&%";

	// 获取SecretKey
	public static SecretKey keyGen(String pwd) {
		return keyGen(pwd.getBytes());
	}

	public static SecretKey keyGen(byte[] pwdByte) {
		SecretKey key = new SecretKeySpec(pwdByte, "AES");
		return key;
	}

	// 加密
	public static byte[] aesEncrypt(String dataStr, String keyStr) throws Exception {
		return aesEncrypt(dataStr.getBytes(), keyStr.getBytes());
	}

	public static byte[] aesEncrypt(byte[] data, String keyStr) throws Exception {
		return aesEncrypt(data, keyStr.getBytes());
	}

	public static byte[] aesEncrypt(String dataStr, SecretKey key) throws Exception {
		return aesEncrypt(dataStr.getBytes(), key);
	}

	public static byte[] aesEncrypt(String dataStr, byte[] keyByte) throws Exception {
		return aesEncrypt(dataStr.getBytes(), keyByte);
	}

	public static byte[] aesEncrypt(byte[] data, byte[] keyByte) throws Exception {
		SecretKey key = keyGen(keyByte);
		return aesEncrypt(data, key);
	}

	public static byte[] aesEncrypt(byte[] data, SecretKey key) throws Exception {
		return aesCrypt(data, key, Cipher.ENCRYPT_MODE);
	}

	// 解密
	public static byte[] aesDecrypt(String dataStr, String keyStr) throws Exception {
		return aesDecrypt(dataStr.getBytes(), keyStr.getBytes());
	}

	public static byte[] aesDecrypt(byte[] data, String keyStr) throws Exception {
		return aesDecrypt(data, keyStr.getBytes());
	}

	public static byte[] aesDecrypt(String dataStr, byte[] keyByte) throws Exception {
		return aesDecrypt(dataStr.getBytes(), keyByte);
	}

	public static byte[] aesDecrypt(byte[] data, byte[] keyByte) throws Exception {
		SecretKey key = new SecretKeySpec(keyByte, "AES");
		return aesCrypt(data, key, Cipher.DECRYPT_MODE);
	}

	public static byte[] aesDecrypt(String dataStr, SecretKey key) throws Exception {
		return aesCrypt(dataStr.getBytes(), key, Cipher.DECRYPT_MODE);
	}

	public static byte[] aesDecrypt(byte[] data, SecretKey key) throws Exception {
		return aesCrypt(data, key, Cipher.DECRYPT_MODE);
	}

	/** 核心加密/解密实现方法 AES128采用PKCS5补码算法 */
	public static byte[] aesCrypt(byte[] data, SecretKey key, int mode) throws Exception {
		Cipher cipher = CipherUtils.initCipher(key, mode, "AES/ECB/PKCS5Padding");
		return CipherUtils.crypt(cipher, data);
	}

}
