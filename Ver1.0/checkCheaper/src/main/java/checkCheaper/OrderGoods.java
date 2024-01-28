package checkCheaper;
import java.util.*;

public class OrderGoods {
	private ArrayList<Goods> list = new ArrayList<Goods>();
	private static OrderGoods instance = new OrderGoods();
	
	public static OrderGoods getInstance() {
		return instance;
	}
	public ArrayList<Goods> getList() {
		return list;
	}
	public void addGoods(Goods e) {
		list.add(e);
	}
	public void replaceGoods(Goods o, Goods t) {
		list.remove(o);
		list.add(t);
	}
}
