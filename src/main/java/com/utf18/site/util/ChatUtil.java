package com.utf18.site.util;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class ChatUtil {
	String type;
	String message;
	String list;

	public ChatUtil() {
	}

	public String split(List<String> mem) {
		String list = "";
		for (int i = 0; i < mem.size(); i++) {
			list += "<a href='#none' onclick=\"insertWisper('" + mem.get(i) + "')\">";
			list += mem.get(i);
			list += "</p>";
		}
		return list;
	}

	public ArrayList<String> FilterwordSave(String csvFile) {
		String line = "";
		String csvSplitBy = ",";
		FileInputStream fileInputStream;

		ArrayList<String> result = new ArrayList<>();
		try {
			fileInputStream = new FileInputStream("D:\\utf18_workspace\\Walalaa\\"+csvFile);
			InputStreamReader inputStreamReader = new InputStreamReader(fileInputStream, "UTF-8");
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

			while ((line = bufferedReader.readLine()) != null) {
				String[] data = line.split(csvSplitBy);
				for (int i = 0; i < data.length; i++) {
					result.add(data[i]);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}

}
