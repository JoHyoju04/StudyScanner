//예약된 스터디룸 정보
package model;

public class RoomBook {
	private String c_id;
	private String s_id;
	private String roomName;
    private String r_date;
    private int r_stime;    
    private int r_ftime;
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

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getRoomName() {
		return roomName;
	}
	public String getDate() {
		return r_date;
	}

	public void setDate(String r_date) {
		this.r_date = r_date;
	}

	public int getStime() {
		return r_stime;
	}

	public void setStime(int r_stime) {
		this.r_stime = r_stime;
	}

	public int getFtime() {
		return r_ftime;
	}

	public void setFtime(int r_ftime) {
		this.r_ftime = r_ftime;
	}


}
