package cx.learningcenter.helper;

import java.io.IOException;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.ObjectWriter;

public  class JsonHelper {
	
	private JsonHelper(){}
	
	public static String convertToJson(Object o){
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		String json = "";
		try {
			json = ow.writeValueAsString(o);
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
		return json;
	}
}
