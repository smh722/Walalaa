package com.utf18.site.util;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	////////알고리즘
	

	public int hohwanCho(int num) {
		switch(num) {
		case 0x3131:
			num=0;
			break;
		case 0x3132:
			num=1;
			break;
		case 0x3134:
			num=2;
			break;
		case 0x3137:
			num=3;
			break;
		case 0x3138:
			num=4;
			break;
		case 0x3139:
			num=5;
			break;
		case 0x3141:
			num=6;
			break;
		case 0x3142:
			num=7;
			break;
		case 0x3143:
			num=8;
			break;
		case 0x3145:
			num=9;
			break;
		case 0x3146:
			num=10;
			break;
		case 0x3147:
			num=11;
			break;
		case 0x3148:
			num=12;
			break;
		case 0x3149:
			num=13;
			break;
		case 0x314A:
			num=14;
			break;
		case 0x314B:
			num=15;
			break;
		case 0x314C:
			num=16;
			break;
		case 0x314D:
			num=17;
			break;
		case 0x314E:
			num=18;
			break;
		default:
			num = num;
			break;
		}
		return num;
	}
	
	public int hohwanJun(int num) {
		switch(num) {
		case 0x314F:
			num=0;
			break;
		case 0x3150:
			num=1;
			break;
		case 0x3151:
			num=2;
			break;
		case 0x3152:
			num=3;
			break;
		case 0x3153:
			num=4;
			break;
		case 0x3154:
			num=5;
			break;
		case 0x3155:
			num=6;
			break;
		case 0x3156:
			num=7;
			break;
		case 0x3157:
			num=8;
			break;
		case 0x3158:
			num=9;
			break;
		case 0x3159:
			num=10;
			break;
		case 0x315A:
			num=11;
			break;
		case 0x315B:
			num=12;
			break;
		case 0x315C:
			num=13;
			break;
		case 0x315D:
			num=14;
			break;
		case 0x315E:
			num=15;
			break;
		case 0x315F:
			num=16;
			break;
		case 0x3160:
			num=17;
			break;
		case 0x3161:
			num=18;
			break;
		case 0x3162:
			num=19;
			break;
		case 0x3163:
			num=20;
			break;
		default:
			num=num;
			break;
		}
		return num;
	}
	
	public int firstMatching(int num) {
	   	 int afternum;
	   	 switch(num) {
	   	 case 0: case 1: case 15:
	   		 afternum=0;
	   		 break;
	   	 case 3: case 4: case 16:
	   		 afternum=3;
	   		 break;
	   	 case 7: case 8: case 17:
	   		 afternum=7;
	   		 break;
	   	 case 9: case 10:
	   		 afternum=9;
	   		 break;
	   	 case 12: case 13: case 14:
	   		 afternum=12;
	   		 break;
	   	 default:
	   		 afternum=num;
	   		 break;
	   	 }
	   	 return afternum;
	    };
	    
	public int secondMatching(int num) {
	        int afternum;
	        switch(num) {
	        case 0: case 2:
	           afternum = 0;
	           break;
	        case 1: case 3: case 5: case 7: case 10: case 11: case 14: case 15:
	           afternum = 1;
	           break;
	        case 4: case 6:
	           afternum = 4;
	           break;
	        case 8: case 12:
	           afternum = 8;
	           break;
	        case 13: case 17:
	           afternum = 13;
	           break;
	        case 16: case 19: case 20:
	           afternum = 20;
	           break;
	        default:
	           afternum = num;
	           break;
	        }
	        return afternum;
	     };
	     
	public int lastMatching(int num) {
	        int afternum;
	        switch(num){
	        case 0:
	           afternum = 0;
	           break;
	        case 1: case 2: case 24:
	           afternum = 1;
	           break;
	        case 7: case 19: case 22: case 23: case 25:
	           afternum = 7;
	           break;
	        case 17: case 26:
	           afternum = 17;
	           break;
	        default:
	           afternum = num;
	           break;
	        }
	        return afternum;
	     };
	     
	public int[] splitHangul(char c) { // 초성, 중성, 종성 분리
	 		int sub[] = new int[3];
	 		sub[0] = (c - 0xAC00) / (21 * 28); //초성의 위치
	 		sub[1] = ((c - 0xAC00) % (21 * 28))/28; //중성의 위치
	 		sub[2] = (c - 0xAC00) % (28); //종성의 위치
	 		return sub;
	 	}
	 	
	public char[] combine(int[] sub) {
	    	 char[] ch = new char[1];
	    	 ch[0] = (char)(0xAC00 + (sub[0] * 21 * 28) + (sub[1] * 28) + sub[2]);
	    	 return ch;
	     }
	

	//기획0번(표준화)
	public static String standardize0(String str) {
	      ChatUtil cu = new ChatUtil();
	      int[] x = null;
	         int loop = str.length();
	         String cb_str = "";
	         char c;
	         for (int i = 0; i < loop; i++) {
	            c = str.charAt(i);
	            if (c >= 0xAC00 && c <= 0xD7A3) {
	              int[] after_x = new int[3];
	               x = cu.splitHangul(c);
	               after_x[0] = cu.firstMatching(x[0]);
	               after_x[1] = cu.secondMatching(x[1]);
	               after_x[2] = cu.lastMatching(x[2]);
	               cb_str += new String(cu.combine(after_x));
	            }
	         }
	         return cb_str;
	   }
	   //기획1,2번(글자사이 특수문자,숫자,영어,자음 제외하기)
	   public static String standardize12(String str) {
	      int[] x = null;
	      int loop = str.length();
	      StringBuffer hangul = new StringBuffer();
	      for(int i=0; i<loop; i++) {
	         if(str.charAt(i)>=0xAC00 && str.charAt(i)<=0xD7A3) {
	            hangul.append(str.charAt(i));
	         }
	         
	      }
	      return hangul.toString();
	   }
	   //기획3번(받침 뺐을때 욕인지 판별)
	   public static String standardize3(String str) {
	      List <Map<String, Integer>> list = new ArrayList<Map<String, Integer>>();
	      String delJong = "";
	      int loop = str.length();
	      
	      for(int i=0; i<loop; i++) {
	         Map<String, Integer> map = new HashMap<String, Integer>();
	         char c = str.charAt(i);
	         if(c>=0xAC00 && c<=0xD743) {
	            char cho = (char)((c-0xAC00)/(21*28));
	            char jun = (char)((c-0xAC00)%(21*28)/28);
	            map.put("cho", (int)cho);
	            map.put("jun", (int)jun);
	            
	            list.add(map);
	         }
	      }
	      for(int i=0; i<list.size(); i++) {
	         int a = (int)(list.get(i).get("cho"));
	         int b = (int)(list.get(i).get("jun"));
	         
	         char temp = (char)(0xAC00 + 28*21*a + 28*b);
	         delJong = delJong.concat(String.valueOf(temp));
	      }
	      return delJong;
	   }
	   //기획6,9,10번(6-ㄱhㅅh끼 9-ㄱㅐㅅㅐㄲㅣ 10-77ㅣ)
	   public static String standardize6910(String str) {
	       int[] x = null;
	       int loop = str.length();
	       String cb_str = "";
	       ChatUtil cu = new ChatUtil();
	       int[] after_x = new int[3];
	       char c;
	       for (int i=0; i< loop; i++) {
	          c = str.charAt(i);
	          if(c>=0xAC00&&c<=0xD7A3) {
	             cb_str += String.valueOf(c);
	          }
	          else if((c >= 0x314F && c <= 0x3163)&&(str.charAt(i-1)==0x0037 && str.charAt(i-2)==0x0037)) { //77ㅣ
	             after_x[0]=1;
	             char b = str.charAt(i);
	             after_x[1] = cu.hohwanJun((int)b);
	             after_x[2] = cu.lastMatching(0);
	             cb_str += new String(cu.combine(after_x)); 
	          }
	          else if(c==0x0072) {//r -> ㅏ
	             char b = str.charAt(i-1);
	             after_x[0] = cu.hohwanCho((int)b);
	             c=0;
	             after_x[1] = cu.secondMatching(c);
	             after_x[2] = cu.lastMatching(0);
	             cb_str += new String(cu.combine(after_x));
	          }else if((c==0x0031||c==0x0049||c==0x0069||c==0x006C)&&(str.charAt(i-1)>=0x3131&&str.charAt(i-1)<=0x314E)) { //1,i,I,l-> ㅣ
	             char b = str.charAt(i-1);
	             after_x[0] = cu.hohwanCho((int)b);
	             c=20;
	             after_x[1] = cu.secondMatching(c);
	             after_x[2] = cu.lastMatching(0);
	             cb_str += new String(cu.combine(after_x));
	             System.out.println(cb_str);
	          }else if(c==0x0048||c==0x0068) { //h,H-> ㅐ
	             char b = str.charAt(i-1);
	             after_x[0] = cu.hohwanCho((int)b);
	             c=1;
	             after_x[1] = cu.secondMatching(c);
	             after_x[2] = cu.lastMatching(0);
	             cb_str += new String(cu.combine(after_x));
	          }else if((c>=0x314F && c<=0x3163)&&(str.charAt(i-1)>=0x3131 && str.charAt(i-1)<=0x314E)) {//ㄱㅐㅅㅐㄲㅣ
	             after_x[0] = cu.hohwanCho((int)str.charAt(i-1));
	             after_x[1] = cu.hohwanJun((int)c);
	             after_x[2] = cu.lastMatching(0);
	             cb_str += new String(cu.combine(after_x));
	          }
	       }
	       return cb_str.toString();
	}
	   

}
