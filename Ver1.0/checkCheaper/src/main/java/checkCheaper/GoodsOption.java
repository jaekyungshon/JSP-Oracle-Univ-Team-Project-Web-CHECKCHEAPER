package checkCheaper;

import java.io.Serializable;
import java.util.*;

public class GoodsOption implements Serializable {
	private String GDS_NM = null; // ��ǰ��
	private String GDS_AREA = null; // ����
	private ArrayList<Integer> GDS_TYPE_LIST = new ArrayList<Integer>(); // ����
	private int CRGRY_ID = 0; // ǰ��
	
	public String getGDS_NM() {
		return GDS_NM;
	}
	public void setGDS_NM(String gDS_NM) {
		GDS_NM = gDS_NM;
	}
	public String getGDS_AREA() {
		return GDS_AREA;
	}
	public void setGDS_AREA(String gDS_AREA) {
		GDS_AREA = gDS_AREA;
	}
	public ArrayList<Integer> getGDS_TYPE_LIST() {
		return GDS_TYPE_LIST;
	}
	public void addGDS_TYPE_LIST(int e) {
		GDS_TYPE_LIST.add(e);
	}
	public int getCRGRY_ID() {
		return CRGRY_ID;
	}
	public void setCRGRY_ID(int cRGRY_ID) {
		CRGRY_ID = cRGRY_ID;
	}
	
	
}
