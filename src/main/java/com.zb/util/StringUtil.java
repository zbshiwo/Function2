package com.zb.util;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

/**
 *
 */
public class StringUtil {
    private static final String AllCHAR = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

    /**
     *
     * @param size
     * @return
     */
    public static final String getRandomNum(int size){
        StringBuffer stringBuffer = new StringBuffer();
        Random random = new Random();

        for (int i = 0; i < size; i++){
            stringBuffer.append(AllCHAR.charAt(random.nextInt(AllCHAR.length())));
        }
        return stringBuffer.toString();
    }

    /**
     *
     * @param str
     * @param charSet
     * @return
     */
    public synchronized static final String getMD5Str(String str, String charSet) { // md5加密
        MessageDigest messageDigest = null;
        try {
            messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.reset();
            if (charSet == null) {
                messageDigest.update(str.getBytes());
            } else {
                messageDigest.update(str.getBytes(charSet));
            }
        } catch (NoSuchAlgorithmException e) {

        } catch (UnsupportedEncodingException e) {


        }

        byte[] byteArray = messageDigest.digest();
        StringBuffer md5StrBuff = new StringBuffer();
        for (int i = 0; i < byteArray.length; i++) {
            if (Integer.toHexString(0xFF & byteArray[i]).length() == 1)
                md5StrBuff.append("0").append(
                        Integer.toHexString(0xFF & byteArray[i]));
            else
                md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));
        }
        return md5StrBuff.toString();
    }

    /**
     *
     * @param str
     * @return
     */
    public static String getBase64(String str){
        if (str == null || str.length() == 0){
            return null;
        }

        byte[] bytes = null;
        String string = null;

        try {
            bytes = str.getBytes("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        string = new BASE64Encoder().encode(bytes);

        return string;
    }

    public static String getFormatBase64(String str){
        byte[] bytes = null;
        String string = null;

        if (str != null && str.length() != 0){
            BASE64Decoder decoder = new BASE64Decoder();
            try {
                bytes = decoder.decodeBuffer(str);
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                string = new String(bytes, "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            return string;
        }

        return null;
    }
}


