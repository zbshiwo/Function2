package com.zb.util;

import org.junit.Test;

import static org.junit.Assert.*;

public class StringUtilTest {
    @Test
    public void getBase64() throws Exception {

    }

    @Test
    public void getFormatBase64() throws Exception {
        String a = StringUtil.getBase64("dawughkjHAduijwhgduyg");
        System.out.println(StringUtil.getFormatBase64("YWRtaW46M2Y4NGZiMWQxMTViYmE5ZWY3ZTUyODJjMjg4NTljMWI="));
    }

}