package logic;

import java.security.Key;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.AlgorithmParameterSpec;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.CompanyDao;
import dao.JobDao;

@Service
public class PageService {
	@Autowired
	private JobDao jobDao;
	@Autowired
	private CompanyDao companyDao;

	public Company comselect(String comid) {
		return companyDao.selectOne(comid);
	}

	public List<Job> jobselect(int comno) {
		System.out.println("comno:" + comno);
		return jobDao.list(comno);
	}

//	@Autowired
//	private ItemDao itemDao;
//	@Autowired
//	private UserDao userDao;
//	@Autowired
//	private SaleDao saleDao;
//	@Autowired
//	private SaleItemDao saleItemDao;
//	@Autowired
//	private BoardDao boardDao;
//	
//	private static byte[] randomKey;
//	AlgorithmParameterSpec paramSpec = new IvParameterSpec(iv);
//	private final static byte[] iv = new byte[] { 
//			(byte) 0x8E, 0x12, 0x39, (byte) 0x9C, 
//			0x07, 0x72, 0x6F, (byte) 0x5A,
//			(byte) 0x8E, 0x12, 0x39, (byte) 0x9C, 
//			0x07, 0x72, 0x6F, (byte) 0x5A };
//	static Cipher cipher;
//	static {
//		try {
//			cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//	
//	public List<Item> getItemList() {
//		return itemDao.list();
//	}
//	
//	public Item getItemDetail(Integer id) {
//		return itemDao.selectOne(id);
//	}
//
//	public void itemCreate(Item item, HttpServletRequest request) {
//		//itemDao는 db에서 가져오는 역할만 수행할 수 있다. 나머지는 service가 수행함.
//		if(item.getPicture()!=null && !item.getPicture().isEmpty()) {
//			uploadFileCreate(item.getPicture(), request, "item/img/");
//			//item.getPicture().getOriginalFilename() : 실제 파일의 이름.
//			item.setPictureUrl(item.getPicture().getOriginalFilename());
//		}
//		itemDao.insert(item);
//	}
//
//	private void uploadFileCreate(MultipartFile picture, HttpServletRequest request, String path) {
//		//업로드된 실제 파일의 이름
//		String orgFile = picture.getOriginalFilename();
//		String uploadPath = request.getServletContext().getRealPath("/")
//				+ path;
//		File fpath = new File(uploadPath);
//		if(!fpath.exists()) {
//			fpath.mkdirs();
//		}
//		try {
//			//업로드 파일 생성하기
//			picture.transferTo(new File(uploadPath + orgFile));
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	public void itemUpdate(Item item, HttpServletRequest request) {
//		if(item.getPicture()!=null && !item.getPicture().isEmpty()) {
//			uploadFileCreate(item.getPicture(), request, "item/img/");
//			item.setPictureUrl(item.getPicture().getOriginalFilename());
//		}
//		itemDao.update(item);
//	}
//
//	public void itemDelete(Integer id) {
//		itemDao.delete(id);
//	}
//
//	public void userCreate(User user) throws NoSuchAlgorithmException {
//		String password = messageDigest(user.getPassword());
//		user.setPassword(password);
//		user.setEmail(encrypt(user.getEmail(), user.getPassword()));
//		userDao.insert(user);
//	}
//
//	public String encrypt(String plain, String password) {
//		byte[] cipherMsg = new byte[1024];
//		try {
//			Key genKey = new SecretKeySpec
//						(password.substring(0,16).getBytes(),"AES");
//			cipher.init(Cipher.ENCRYPT_MODE, genKey, paramSpec);
//			cipherMsg = cipher.doFinal(plain.getBytes());
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		//Byte형 암호문을 hexa 값으로 변경하여 전달한다.
//		return byteToHex(cipherMsg);
//	}
//
//	private String byteToHex(byte[] cipherMsg) {
//		if (cipherMsg == null)
//			return null;
//		String str = "";
//		for (byte b : cipherMsg) {
//			//1바이트씩 출력하여 2자리수의 16진수 값으로 변경한다.
//			str += String.format("%02X", b);
//		}
//		return str;
//	}
//
//	public String messageDigest(String password) throws NoSuchAlgorithmException {
//		byte[] plain = password.getBytes();
//		byte[] hash = null;
//		String result = "";
//		MessageDigest md;
//		try{
//			md = MessageDigest.getInstance("SHA-256");
//			hash = md.digest(plain);
//			for(byte b : hash) {
//				result += String.format("%02X", b);
//			}
//		}catch(NoSuchAlgorithmException e) {
//			e.printStackTrace();
//		}
//		return result;
//	}
//
//	public User userSelect(String userId) {
//		User user = userDao.selectOne(userId);
//		if(user != null) {
//			user.setEmail(decript(user.getEmail(),user.getPassword()));
//		}
//		return user;
//	}
//
//	public Sale checkEnd(User loginUser, Cart cart) {
//		Sale sale = new Sale();
//		sale.setSaleId(saleDao.getMaxSaleId());
//		sale.setUser(loginUser);
//		sale.setUpdatetime(new Date());
//		List<ItemSet> itemList = cart.getItemSetList();
//		int i = 0;
//		for(ItemSet is : itemList) {
//			int saleItemId = ++i;
//			SaleItem saleItem = new SaleItem(sale.getSaleId(), saleItemId, is);
//			sale.getItemList().add(saleItem);
//		}
//		saleDao.insert(sale);
//		List<SaleItem> saleItemList = sale.getItemList();
//		for(SaleItem si : saleItemList) {
//			saleItemDao.insert(si);
//		}
//		return sale;
//	}
//
//	public List<Sale> salelist(String id) {
//		return saleDao.list(id);
//	}
//
//	public List<SaleItem> saleItemList(int saleId) {
//		return saleItemDao.list(saleId);
//	}
//
//	public void userUpdate(User user) throws NoSuchAlgorithmException {
//		user.setEmail(encrypt(user.getEmail(), user.getPassword()));
//		userDao.update(user);
//	}
//
//	public void deleteUser(User user) {
//		userDao.delete(user);
//	}
//
//	public List<User> userList() {
//		List<User> list = userDao.list();
//		for(User u : list) {
//			u.setEmail(decript(u.getEmail(),u.getPassword()));
//		}
//		return list;
//	}
//
//	public List<User> userList(String[] idchks) {
//		List<User> list = userDao.list(idchks);
//		for(User u : list) {
//			u.setEmail(decript(u.getEmail(),u.getPassword()));
//		}
//		return list;
//	}
//
//	public String decript(String cipherMsg, String password) {
//		byte[] plainMsg = new byte[1024];
//		try {
//			Key genKey = new SecretKeySpec
//							(password.substring(0,16).getBytes(), "AES");
//			cipher.init(Cipher.DECRYPT_MODE, genKey, paramSpec);
//			plainMsg = cipher.doFinal(hexToByte(cipherMsg.trim()));
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return new String(plainMsg).trim();
//	}
//
//	public byte[] hexToByte(String str) {
//		if (str == null)
//			return null;
//		if (str.length() < 2)
//			return null;
//		int len = str.length() / 2;
//		byte[] buf = new byte[len];
//		for (int i = 0; i < len; i++) {
//			buf[i] = (byte) Integer.parseInt(str.substring(i * 2, i * 2 + 2), 16);
//		}
//		return buf;
//	}
//
//	public int boardcount(String column, String find) {
//		return boardDao.count(column, find);
//	}
//
//	public List<Board> boardlist(int pageNum, int limit, String column, String find) {
//		return boardDao.list(pageNum, limit, column, find);
//	}
//
//	public Board getBoard(Integer num, HttpServletRequest request) {
//		if(request.getRequestURI().contains("detail")) {
//			boardDao.readcntadd(num);
//		}//조회 할때만 조회수를 올려야 하므로 uri를 받아서 따로 처리해준다.
//		return boardDao.selectOne(num);
//	}
//
//	public void write(Board board, HttpServletRequest request) {
//		if(board.getFile1()!=null && !board.getFile1().isEmpty()) {
//			uploadFileCreate(board.getFile1(), request, "board/file/");
//			board.setFileurl(board.getFile1().getOriginalFilename());
//		}
//		
//		int maxnum = boardDao.maxNum();
//		board.setNum(++maxnum);
//		board.setRef(maxnum);
//		boardDao.insert(board);
//	}
//
//	public void boardReply(Board board) {
//		boardDao.updateRefStep(board);
//		int maxnum = boardDao.maxNum();
//		board.setNum(++maxnum);
//		board.setReflevel(board.getReflevel()+1);
//		board.setRefstep(board.getRefstep() + 1);
//		boardDao.insert(board);
//	}
//
//
//	public void boardUpdate(Board board, HttpServletRequest request) {
//		if(board.getFile1()!=null && !board.getFile1().isEmpty()) {
//			uploadFileCreate(board.getFile1(), request, "board/file/");
//			board.setFileurl(board.getFile1().getOriginalFilename());
//		}
//		boardDao.update(board);
//	}
//
//	public void boardDelete(Board board) {
//		boardDao.delete(board.getNum());
//	}
//
//	public Map<String, Object> graph() {
//		Map<String, Object> map = new HashMap<String, Object>();
//		//boardDao.graph() : List<Map<String, Object>>객체임.
//		for(Map<String, Object> m : boardDao.graph()) {
//			//m.get("key1") : "홍길동"
//			//m.get("value1") : 15
//			map.put((String)m.get("key1"), m.get("value1"));
//		}
//		return map;
//	}
//

}
