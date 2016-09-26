package com.lyz.easybuy.util;

import com.google.gson.Gson;

/**
 * @Title: JsonUtil.java
 * @Package: com.winphone.payms.util
 * @Description: TODO:JSON处理类
 * @author 何喆
 * @date 2016-3-29 下午1:21:28
 * @version 1.0.1
 * @see
 */
public class JsonUtil {
	/**
	 * @Description 类转JSon字符串
	 * @param object
	 * @return
	 */

	private static Gson gson = new Gson();

	public static String toJsonStr(Object object) {
		String json = gson.toJson(object);
		return json;
	}

	/**
	 * @Description 格式化字符串
	 * @param jsonStr
	 * @return
	 */
	public static String formatJson(String jsonStr) {
		if (null == jsonStr || "".equals(jsonStr))
			return "";
		StringBuilder sb = new StringBuilder();
		char last = '\0';
		char current = '\0';
		int indent = 0;
		for (int i = 0; i < jsonStr.length(); i++) {
			last = current;
			current = jsonStr.charAt(i);
			switch (current) {
			case '{':
			case '[':
				sb.append(current);
				sb.append('\n');
				indent++;
				addIndentBlank(sb, indent);
				break;
			case '}':
			case ']':
				sb.append('\n');
				indent--;
				addIndentBlank(sb, indent);
				sb.append(current);
				break;
			case ',':
				sb.append(current);
				if (last != '\\') {
					sb.append('\n');
					addIndentBlank(sb, indent);
				}
				break;
			default:
				sb.append(current);
			}
		}

		return sb.toString();
	}

	/**
	 * @Description 添加space
	 * @param sb
	 * @param indent
	 */
	private static void addIndentBlank(StringBuilder sb, int indent) {
		for (int i = 0; i < indent; i++) {
			sb.append('\t');
		}
	}
}
