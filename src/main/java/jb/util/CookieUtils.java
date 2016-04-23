package jb.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Cookie操作工具类，提供常用的Cookie操作实现
 * @author 
 * @email 
 */
public class CookieUtils {
	
	/**
	 * 获取Cookie信息
	 * @param request HTTP请求
	 * @param key Cookie键
	 * @return null表示未找到指定Cookie信息
	 */
	public static String getCookie(HttpServletRequest request, String key) {
		Cookie[] cookies = request.getCookies();
		if (cookies == null || cookies.length == 0)
			return null;
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals(key))
				return cookies[i].getValue();
		}
		return null;
	}

	/**
	 * 保存Cookie信息到根路径
	 * @param response HTTP响应
	 * @param key Cookie键
	 * @param value Cookie值
	 */
	public static void saveCookie(HttpServletResponse response, String key,
			String value) {
		saveCookie(response, key, value, -1,"/") ;
	}
	
	/**
	 * 保存Cookie信息到指定路径
	 * @param response HTTP响应
	 * @param key Cookie键
	 * @param value Cookie值
	 */
	public static void saveCookie(HttpServletResponse response, String key,
			String value,String path) {
		saveCookie(response, key, value, -1,path) ;
	}
	
	/**
	 * 保存Cookie信息到指定路径，并设置过期时间
	 * @param response HTTP响应
	 * @param key Cookie键
	 * @param value Cookie值
	 * @param second 过期时间，单位是秒
	 * @param path 路径
	 */
	public static void saveCookie(HttpServletResponse response, String key,
			String value,int second,String path) {
		Cookie cookie = new Cookie(key, value);
		cookie.setPath(path);
		cookie.setMaxAge(second);
		cookie.setDomain("."+Constants.domain);
		response.addCookie(cookie);
	}
	
	/**
	 * 保存Cookie信息到指定域名的指定路径，并设置过期时间
	 * @param response HTTP响应
	 * @param key Cookie键
	 * @param value Cookie值
	 * @param second 过期时间，单位是秒
	 * @param path 路径
	 * @param domain 域名
	 */
	public static void saveCookie(HttpServletResponse response, String key,
			String value,int second,String path, String domain) {
		Cookie cookie = new Cookie(key, value);
		cookie.setPath(path);
		cookie.setMaxAge(second);
		cookie.setDomain(domain);
		response.addCookie(cookie);
	}
	
	/**
	 * 清除指定Cookie
	 * @param response HTTP响应
	 * @param key Cookie键
	 * @param second 延迟删除时间，0表示立即删除，负数表示关闭浏览器时删除
	 * @param path 路径
	 */
	public static void clearCookie(HttpServletResponse response, String key,
			int second,String path){
		if(key.equals("xng")){
			try{
				throw new Exception() ;
			}catch(Exception e){
				e.printStackTrace(System.out) ;
			}
		}
		Cookie cookie = new Cookie(key,null);
		cookie.setPath(path);
		cookie.setMaxAge(second);
		cookie.setDomain("."+Constants.domain);
		response.addCookie(cookie) ;
	}
	
	/**
	 * 清除指定Cookie
	 * @param response HTTP响应
	 * @param key Cookie键
	 * @param second 延迟删除时间，0表示立即删除，负数表示关闭浏览器时删除
	 * @param path 路径
	 * @param domain 域名
	 */
	public static void clearCookie(HttpServletResponse response, String key,
			int second,String path, String domain){
		if(key.equals("xng")){
			try{
				throw new Exception() ;
			}catch(Exception e){
				e.printStackTrace(System.out) ;
			}
		}
		Cookie cookie = new Cookie(key,null);
		cookie.setPath(path);
		cookie.setMaxAge(second);
		cookie.setDomain(domain);
		response.addCookie(cookie) ;
	}	

}
