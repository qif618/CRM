package com.lyf.jstl;

import java.util.List;

public class MapFunction {

	public static boolean contains(List<String> map, String value) {
		if(map!=null) {
			
			return map.contains(value);
		}
		return false;
	}
}
