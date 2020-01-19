//예약된 좌석 정보
package model;

public class SeatBook {
	private String c_id;
	private String s_id;
	private String seati;
    private String res_date;
    private int res_stime;    
    private int res_ftime;
    public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.s_id = c_id;
	}

	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id=s_id;
	}

	public void setSeati(String seati) {
		this.seati = seati;
	}

	public String getSeati() {
		return seati;
	}

	public void setCafeName(String seati) {
		this.seati = seati;
	}

	public String getDate() {
		return res_date;
	}

	public void setDate(String res_date) {
		this.res_date = res_date;
	}

	public int getStime() {
		return res_stime;
	}

	public void setStime(int res_stime) {
		this.res_stime = res_stime;
	}

	public int getFtime() {
		return res_ftime;
	}

	public void setFtime(int res_ftime) {
		this.res_ftime = res_ftime;
	}


}
