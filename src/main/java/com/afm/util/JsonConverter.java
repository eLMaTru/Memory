package com.afm.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import com.afm.model.Comment;
import com.afm.model.PhoneNumber;

public class JsonConverter {
	
	
	public List<String> convertToArrayJsonString(List<PhoneNumber> phone){
		List<String> jsonString = new ArrayList<String>();
		ObjectMapper mapper = new ObjectMapper();
	
for(int i =0; i < phone.size(); i++){
	
	try {
		jsonString.add(mapper.writeValueAsString(phone.get(i)));
	
	} catch (JsonGenerationException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (JsonMappingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
}		
		
		return jsonString;
	}
	
	public List<String> commentToJsonArray(List<Comment> comment){
		List<String> jsonString = new ArrayList<String>();
		ObjectMapper mapper = new ObjectMapper();
	
for(int i =0; i < comment.size(); i++){
	
	try {
		jsonString.add(mapper.writeValueAsString(comment.get(i)));
	
	} catch (JsonGenerationException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (JsonMappingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
}		
		
		return jsonString;
	}

}	