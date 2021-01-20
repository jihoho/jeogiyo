package com.jeogiyo.main;

import java.io.*;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.boot.web.servlet.ServletContextInitializer;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class ServletContextInit implements ServletContextInitializer {
	
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
//        TimeZone.setDefault(TimeZone.getTimeZone("Asia/Seoul"));
		JSONParser parser = new JSONParser();
		try {
			
			String category_list_file= servletContext.getRealPath("/")+"resources\\category.json";
			System.out.println("category file: "+ category_list_file);
			JSONArray jsonArray=
                    (JSONArray) parser.parse(new BufferedReader(
                                                new InputStreamReader(
                                                        new FileInputStream(category_list_file),"euc-kr")));
			List<Map<String, String>> categoryList=getListMapFromJsonArray(jsonArray);
			servletContext.setAttribute("categoryList", categoryList);
			System.out.println("name:"+categoryList.get(0).get("name"));
			System.out.println(jsonArray.toJSONString());
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Servlet Context init!!");

	}
	
	public Map<String, String> getMapFromJsonObject( JSONObject jsonObj )
    {
        Map<String, String> map = null;
        
        try {
            
            map = new ObjectMapper().readValue(jsonObj.toJSONString(), Map.class) ;
            
        } catch (JsonParseException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
 
        return map;
    }
  
	public List<Map<String, String>> getListMapFromJsonArray( JSONArray jsonArray )
    {
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        
        if( jsonArray != null )
        {
            int jsonSize = jsonArray.size();
            for( int i = 0; i < jsonSize; i++ )
            {
                Map<String, String> map = getMapFromJsonObject( ( JSONObject ) jsonArray.get(i) );
                list.add( map );
            }
        }
        
        return list;
    }
	
}
