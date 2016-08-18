package com.afm.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.afm.model.Authorities;
import com.afm.model.Category;
import com.afm.model.User;
import com.afm.repository.UserRepository;

@Service("userService")
public class UserServiceImpl implements UserService {

	private static final String FILE_lOCATION = "/home/anderson/workspace/Memory/src/main/webapp/img/";
	private static final String DEFAULT_FILE = "/home/anderson/workspace/Memory/src/main/webapp/img/user.png";
	@Autowired
	private UserRepository userRepository;
   
  
    
	@Transactional
	public User saveUser(User user) throws Exception {
		BCryptPasswordEncoder bCry = new BCryptPasswordEncoder();
		String password = bCry.encode(user.getPassword());
		user.setPassword(password);
		user.setEnabled(true);

		if(user.getImg().isEmpty() == false){
			CommonsMultipartFile uploaded = user.getImg();
			File localFile = new File(FILE_lOCATION + uploaded.getOriginalFilename());
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
			user.setImg(null);
			user.setRutaImg(FILE_lOCATION + uploaded.getOriginalFilename());
			userRepository.saveUser(user);
		}else{
			user.setImg(null);
			user.setRutaImg(DEFAULT_FILE);
			userRepository.saveUser(user);
		}

		return user;
	}

	

	@Transactional
	public void deleteUser(int idUser) {

		userRepository.delete(idUser);
	}


	public User getOneUser(String username) {
	User	user = userRepository.getOneUser(username);
		return user;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<User> findAllUsers() {
		List users = new ArrayList();
		Iterator it = userRepository.findAllUser().iterator();

		while (it.hasNext()) {
			User user = (User) it.next();
			user.setRutaImg(user.getRutaImg().substring(47, user.getRutaImg().length()));
			users.add(user);
		}
		return users;
	}

	public List<Category> findAllCategory() {
		List<Category> categories = new ArrayList<Category>();

		Category home = new Category();
		home.setCategory("HOME");
		categories.add(home);

		Category work = new Category();
		work.setCategory("WORK");
		categories.add(work);

		Category other = new Category();
		other.setCategory("OTHER");
		categories.add(other);

		return categories;
	}

	@Transactional
	public void saveAuthority() {
		Authorities aut = new Authorities();
		User user = userRepository.findAllUser().get((userRepository.findAllUser().size() - 1));
		aut.setUsername(user.getUserName());
		aut.setauthority("ROLE_USER");
		aut.setUser(user);
		userRepository.saveAuthority(aut);
	}

}
