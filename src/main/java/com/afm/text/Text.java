package com.afm.text;

public class Text {

	public static void main(String[] args) {
		
		/*
		UserRepository user = new UserRepositoryImpl();
		User users = new User();
		//users.setId((long) 1);
		users.setEmail("hola");
		users.setPassword("hola");
		users.setUserName("hola");
		user.saveUser(users);
		int var = 3;
		System.out.println("show"+ var +user+user.findAllUser().get(0).getUserName() );
      // user.delete(var);
		*/
		
		
		System.out.println("holaaaa mundoooo" );
	}
	
	
	/*
	@RequestMapping(value="hello", method=RequestMethod.POST)
	public String saludo(@ModelAttribute("prueba")Prueba prueba){
		
		try {
			grabarFicheroALocal(prueba);
		} catch (Exception e) {
			e.printStackTrace();
			return "No se ha podido grabar el fichero";
		}
    	
    	return "hello";
    }
 
	private void grabarFicheroALocal(Prueba prueba) throws Exception {
		CommonsMultipartFile uploaded = prueba.getFichero();
    	File localFile = new File("/home/anderson/workspace/Memory/src/main/webapp/img/"+uploaded.getOriginalFilename());
    	FileOutputStream os = null;
    	
    	try {
    		
    		os = new FileOutputStream(localFile);
    		os.write(uploaded.getBytes());
    		
    	} finally {
    		if (os != null) {
    			try {
					os.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
    		}
    	}
	
	
		
	
	}
	*/

}
