package logic;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

public class Cart {
	private List<ItemSet> itemSetList = new ArrayList<ItemSet>();
	
	public List<ItemSet> getItemSetList(){
		return itemSetList;
	}
	public long getTotal() {
		long sum = 0;
		for(ItemSet is : itemSetList) {
			sum += is.getQuantity() * is.getItem().getPrice();
			return sum;
		}
		return 0;
	}
	
	public void push(ItemSet itemSet) {
		//itemSetList : 장바구니 목록
		//itemSet : 구매자가 장바구니에 추가한 상품
		for(ItemSet is : itemSetList) {
			//만약 이미 장바구니에 있는 상품이라면 수량만 증가시켜 준다.
			if(is.getItem().getId() == itemSet.getItem().getId()) {
				is.setQuantity(is.getQuantity() + itemSet.getQuantity());
				return;
			}
		}
		itemSetList.add(itemSet);
	}
	public boolean isEmpty() {
		return itemSetList == null || itemSetList.size() == 0;
	}
	public void clearAll(HttpSession session) {
		itemSetList.clear();
		session.setAttribute("CART", this);//위에서 clear 했으므로 내용이 지워진다.
	}
	
}
