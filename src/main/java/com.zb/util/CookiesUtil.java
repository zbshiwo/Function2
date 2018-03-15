package com.zb.util;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 *该类可以从浏览器的请求中提取出cookies并对cookies进行操作
 * @author zbshiwo
 */
public class CookiesUtil {

    /**
     * 将cookies封装进map中
     * @param request 浏览器请求
     * @return 将cookies封装进map中并返回
     */
    private static Map<String, Cookie> ReadCookiesMap(HttpServletRequest request){
        Map<String, Cookie> map = new HashMap<String, Cookie>();

        Cookie[] cookies = request.getCookies();
        if (cookies != null && cookies.length != 0){
            for (Cookie cookie : cookies){
                map.put(cookie.getName(), cookie);
            }
        }
        return map;
    }

    /**
     *根据name从map中拿出cookie
     * @param request 浏览器请求
     * @param name  cookie的name
     * @return cookie信息
     */
    public static Cookie getCookieByName(HttpServletRequest request, String name){
        Map<String, Cookie> map = ReadCookiesMap(request);

        if (map.containsKey(name)){
            Cookie cookie = map.get(name);
            return cookie;
        }
        return null;
    }

    /**
     *
     * @param response
     * @param name
     * @param value
     * @param time
     * @return
     */
    public static HttpServletResponse setCookie(HttpServletResponse response, String name, String value, int time){
        Cookie cookie = new Cookie(name, value);

        cookie.setPath("/");
        cookie.setMaxAge(time);
        response.addCookie(cookie);

        return response;
    }

    public static void deleteCookieByName(HttpServletRequest request, HttpServletResponse response, String name){
        Map<String, Cookie> cookieMap = ReadCookiesMap(request);

        if (cookieMap.isEmpty()){
            return;
        }

        for (String key : cookieMap.keySet()) {
            if(key.equals(name)) {
                Cookie cookie = cookieMap.get(key);
                cookie.setMaxAge(0);//设置cookie有效时间为0
                cookie.setPath("/");//不设置存储路径
                response.addCookie(cookie);
            }
        }
    }
}
