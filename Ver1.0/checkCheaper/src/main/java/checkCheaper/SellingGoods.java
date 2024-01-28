package checkCheaper;

import java.io.Serializable;

public class SellingGoods implements Serializable {
	private int IVT_ID;
	private int IVT_CNT;
	private int IVT_GRD_LEVEL;
	private int IVT_GDS_AMT;
	private int IVT_GDS_ORDR_CNT;
	private int GDS_ID;
	private String GDS_NM;
	private String FRCS_ID;
	private String FRCS_NM;
	private String FRCS_CO_ADDR;
	
	public String getFRCS_NM() {
		return FRCS_NM;
	}
	public void setFRCS_NM(String e) {
		FRCS_NM=e;
	}
	public String getFRCS_CO_ADDR() {
		return FRCS_CO_ADDR;
	}
	public void setFRCS_CO_ADDR(String e) {
		FRCS_CO_ADDR=e;
	}
	public int getIVT_ID() {
		return IVT_ID;
	}
	public void setIVT_ID(int iVT_ID) {
		IVT_ID = iVT_ID;
	}
	public int getIVT_CNT() {
		return IVT_CNT;
	}
	public void setIVT_CNT(int iVT_CNT) {
		IVT_CNT = iVT_CNT;
	}
	public int getIVT_GRD_LEVEL() {
		return IVT_GRD_LEVEL;
	}
	public void setIVT_GRD_LEVEL(int iVT_GRD_LEVEL) {
		IVT_GRD_LEVEL = iVT_GRD_LEVEL;
	}
	public int getIVT_GDS_AMT() {
		return IVT_GDS_AMT;
	}
	public void setIVT_GDS_AMT(int iVT_GDS_AMT) {
		IVT_GDS_AMT = iVT_GDS_AMT;
	}
	public int getIVT_GDS_ORDR_CNT() {
		return IVT_GDS_ORDR_CNT;
	}
	public void setIVT_GDS_ORDR_CNT(int iVT_GDS_ORDR_CNT) {
		IVT_GDS_ORDR_CNT = iVT_GDS_ORDR_CNT;
	}
	public int getGDS_ID() {
		return GDS_ID;
	}
	public void setGDS_ID(int gDS_ID) {
		GDS_ID = gDS_ID;
	}
	public String getFRCS_ID() {
		return FRCS_ID;
	}
	public void setFRCS_ID(String fRCS_ID) {
		FRCS_ID = fRCS_ID;
	}
	public String getGDS_NM() {
		return GDS_NM;
	}
	public void setGDS_NM(String gDS_NM) {
		GDS_NM = gDS_NM;
	}
}
