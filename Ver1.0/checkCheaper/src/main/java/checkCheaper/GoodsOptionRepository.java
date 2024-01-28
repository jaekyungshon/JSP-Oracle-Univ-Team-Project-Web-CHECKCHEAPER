package checkCheaper;
import java.util.*;

public class GoodsOptionRepository {
	private ArrayList<GoodsOption> goodsList = new ArrayList<GoodsOption>();
	private static GoodsOptionRepository instance = new GoodsOptionRepository();
	
	public static GoodsOptionRepository getInstance() {
		return instance;
	}
	public ArrayList<GoodsOption> getGoodsList() {
		return goodsList;
	}
	public void addGoods(GoodsOption g) {
		goodsList.add(g);
	}
}
