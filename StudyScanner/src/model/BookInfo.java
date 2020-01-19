// 좌석예약 정보 (Booked Seat Information)
package model;
 
public class BookInfo {
   private String s_id;

   private String c_id;

    private String seati;

    private String res_date;
    private String res_stime;
    private String res_ftime;
    
   public String getS_id() {
      return s_id;
   }
   public void setS_id(String s_id) {
      this.s_id = s_id;
   }
   public String getC_id() {
      return c_id;
   }
   public void setC_id(String c_id) {
      this.c_id = c_id;
   }
   public String getSeati() {
      return seati;
   }
   public void setSeati(String seati) {
      this.seati = seati;
   }
   public String getRes_date() {
      return res_date;
   }
   public void setRes_date(String res_date) {
      this.res_date = res_date;
   }
   public String getRes_stime() {
      return res_stime;
   }
   public void setRes_stime(String res_stime) {
      this.res_stime = res_stime;
   }
   public String getRes_ftime() {
      return res_ftime;
   }
   public void setRes_ftime(String res_ftime) {
      this.res_ftime = res_ftime;
   }
}