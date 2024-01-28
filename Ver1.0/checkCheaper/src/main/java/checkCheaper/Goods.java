package checkCheaper;

import java.io.Serializable;

public class Goods implements Serializable{
	private int inventoryKey;
	private String goodsName;
	private String franchiseName;
	private String franchiseAddress;
	private String goodsLevel;
	private String quantity;
	private String price;
	private int inputQuantity=1;
	private int tableRowNum=0;
	
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getFranchiseName() {
		return franchiseName;
	}
	public void setFranchiseName(String franchiseName) {
		this.franchiseName = franchiseName;
	}
	public String getFranchiseAddress() {
		return franchiseAddress;
	}
	public void setFranchiseAddress(String franchiseAddress) {
		this.franchiseAddress = franchiseAddress;
	}
	public String getGoodsLevel() {
		return goodsLevel;
	}
	public void setGoodsLevel(String goodsLevel) {
		this.goodsLevel = goodsLevel;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getInventoryKey() {
		return inventoryKey;
	}
	public void setInventoryKey(int key) {
		inventoryKey = key;
	}
	public int getInputQuantity() {
		return inputQuantity;
	}
	public void setInputQuantity(int inputQuantity) {
		this.inputQuantity = inputQuantity;
	}
	public int getTableRowNum() {
		return tableRowNum;
	}
	public void setTableRowNum(int a) {
		tableRowNum=a;
	}
	
}
