package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import file.FileDTO;

public class DBUtil {
	
	//고객 아이디 체크
	public static int CheckUser(Connection con, String uid) { 
		String sqlSt = "SELECT * FROM customer_info WHERE c_id=?";
		
		int rst=0;
		ResultSet rs = null;

		PreparedStatement pstmt=null;
		try {
			pstmt = con.prepareStatement(sqlSt);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rst = 1;
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			System.out.close();
		}
		return rst;
	}
	
	//관리회원 아이디 체크
	public static int CheckSUser(Connection con, String uid) { 
        String sqlSt = "SELECT * FROM staff_info WHERE s_id=?";
		
		int rst=0;
		ResultSet rs = null;

		PreparedStatement pstmt=null;
		try {
			pstmt = con.prepareStatement(sqlSt);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rst = 1;
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			System.out.close();
		}
		return rst;
	}
	
	//고객 로그인
	public static ResultSet findUser(Connection con, String uid) { 
		String sqlSt = "SELECT c_passwd FROM customer_info WHERE c_id=";

		Statement st;
		try {
			st = con.createStatement(ResultSet.CONCUR_UPDATABLE,ResultSet.TYPE_SCROLL_SENSITIVE);
			if (st.execute(sqlSt + "'" + uid + "'")) {
				return st.getResultSet();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//관리회원 로그인
	public static ResultSet findSUser(Connection con, String uid) { 
		String sqlSt = "SELECT s_passwd FROM staff_info WHERE s_id=";
		
		Statement st;
		try {
			st = con.createStatement(ResultSet.CONCUR_UPDATABLE,ResultSet.TYPE_SCROLL_SENSITIVE);
			if (st.execute(sqlSt + "'" + uid + "'")) {
				return st.getResultSet();
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;
		
	}
	
	//고객회원 회원가입
	public static void createUser(Connection con,String id,String passwd,String name,String phone) { 
		String st = "INSERT INTO customer_info (c_id, c_passwd,c_name,c_phone) VALUES (?,?,?,?)";

		PreparedStatement pstmt=null;

		try {
			
			pstmt= con.prepareStatement(st);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			pstmt.setString(3, name);
			pstmt.setString(4, phone);

			pstmt.execute();
		      
	
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
        }

		
	}
	
	//관리회원 회원가입
	public static void createSUser(Connection con,String id,String passwd,String cafename,String address,String s_bn) { 
		String st = "INSERT INTO staff_info (s_id, s_passwd,s_cafeName,s_address,s_bn) VALUES (?,?,?,?,?)";

		PreparedStatement pstmt=null;

		try {
			
			pstmt= con.prepareStatement(st);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			pstmt.setString(3, cafename);
			pstmt.setString(4, address);
			pstmt.setString(5, s_bn);

			pstmt.execute();
		      
	
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {}
		
	}
	
	//관리회원 카페정보입력
	public static int createCafeInfo(Connection con,String s_id,String pt1,String pt2,String pt3,String tel,String price,String time) { 
		String st ="update staff_info set s_photo1=?, s_photo2=?, s_photo3=?, s_tel=?, s_price=?, s_time=? where s_id=?";
		
		PreparedStatement pstmt=null;
		int result=0;

		try {
			
			pstmt= con.prepareStatement(st);
			pstmt.setString(1, pt1);
			pstmt.setString(2, pt2);
			pstmt.setString(3, pt3);
			pstmt.setString(4, tel);
			pstmt.setString(5, price);
			pstmt.setString(6, time);
			pstmt.setString(7, s_id);

			result = pstmt.executeUpdate(); 
	
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			return result;
		}
            
		
	}
	
	//예약된 좌석 정보 검색
	public static ArrayList<SeatBook> searchBook(Connection con, String c_id) { 
	      String sqlSt = "SELECT * FROM time_table WHERE c_id=?";
	      PreparedStatement pstmt = null;
	      ResultSet rs;
	      ArrayList<SeatBook> list = new ArrayList<SeatBook>();
	      try {

	         pstmt = con.prepareStatement(sqlSt);
	         pstmt.setString(1,c_id);
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	            SeatBook sb = new SeatBook();
	            
	            sb.setS_id(rs.getString("s_id"));
	            sb.setSeati(rs.getString("seati"));
	            sb.setDate(rs.getString("res_date"));
	            sb.setStime(rs.getInt("res_stime"));
	            sb.setFtime(rs.getInt("res_ftime"));

	            list.add(sb);
	         }

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         return list;
	      }

	   }
	
	//예약된 스터디룸 정보 검색
	public static ArrayList<RoomBook> searchRoomBook(Connection con, String c_id) { 
	      String sqlSt = "SELECT * FROM room_time_table WHERE fk_c_id=?";
	      PreparedStatement pstmt = null;
	      ResultSet rs;
	      ArrayList<RoomBook> list = new ArrayList<RoomBook>();
	      try {

	         pstmt = con.prepareStatement(sqlSt);
	         pstmt.setString(1,c_id);
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	            RoomBook rb = new RoomBook();
	            
	            rb.setS_id(rs.getString("fk_s_id"));
	            rb.setRoomName(rs.getString("fk_roomName"));
	            rb.setDate(rs.getString("r_date"));
	            rb.setStime(rs.getInt("r_stime"));
	            rb.setFtime(rs.getInt("r_ftime"));

	            list.add(rb);
	         }

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         return list;
	      }

	   }
	
	// 등록된 카페아이디로 이름찾기
	public static String searchCafeName(Connection con,String s_id) { 
	      String sqlSt = "SELECT s_cafeName FROM staff_info WHERE s_id=?";
	      PreparedStatement pstmt = null;
	      ResultSet rs;
	      String status ="";

	      try {
	         pstmt = con.prepareStatement(sqlSt);
	         pstmt.setString(1,s_id );
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	            status=rs.getString("s_cafeName");;
	            return status;
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return status;
	   }
	   
	//카페 검색하여 카페정보 불러오기
	 public static ArrayList<StudyCafe> searchCafe(Connection con, String name) { 
			String sqlSt = "SELECT * FROM staff_info WHERE binary(s_cafeName) LIKE ?";
			PreparedStatement pstmt=null;
			ResultSet rs;
			ArrayList<StudyCafe> list = new ArrayList<StudyCafe>();
			
			try {
			
				pstmt= con.prepareStatement(sqlSt);
				pstmt.setString(1, "%"+name+"%");
				rs = pstmt.executeQuery();
				while(rs.next()) {
					StudyCafe s=new StudyCafe();
					s.setCafeName(rs.getString("s_cafeName"));

					s.setTel(rs.getString("s_tel"));
					s.setAddress(rs.getString("s_address"));

					list.add(s);
					
				}
		         
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				return list;
			}
			
		}
	 
	//관리회원 좌석 등록
	 public static void createSeat(Connection con, String s_id, int s,int status) {

		      String st = "INSERT INTO seat (s_id,s,status) VALUES (?,?,?)";

		      PreparedStatement pstmt = null;

		      try {
		       
		         pstmt = con.prepareStatement(st);

		         pstmt.setString(1, s_id);
		         pstmt.setInt(2, s);
		         pstmt.setInt(3, status);


		         pstmt.execute();

		      } catch (SQLException e) {

		         e.printStackTrace();
		      }

		   }
	 
	//카페 검색결과
	 public static ArrayList<StudyCafe> sarchResultCafe(Connection con, String name) { 
			String sqlSt = "SELECT * FROM staff_info WHERE binary(s_cafeName)=? ";
			PreparedStatement pstmt=null;
			ResultSet rs;
			ArrayList<StudyCafe> list = new ArrayList<StudyCafe>();
			
			try {

				pstmt= con.prepareStatement(sqlSt);
				pstmt.setString(1, name);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					StudyCafe s=new StudyCafe();
					s.setCafeName(rs.getString("s_cafeName"));
					s.setPhoto1(rs.getString("s_photo1"));
					s.setPhoto2(rs.getString("s_photo2"));
					s.setPhoto3(rs.getString("s_photo3"));
					s.setPrice(rs.getString("s_price"));
					s.setTel(rs.getString("s_tel"));
					s.setAddress(rs.getString("s_address"));
					s.setTime(rs.getString("s_time"));
					s.setS_id(rs.getString("s_id"));
					list.add(s);
					
				}
		         
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				return list;
			}
			
		}
	 
	//카페좌석 예약검색
	 public static ArrayList<BookInfo> resultBook(Connection con, String id) { 
	        String sqlSt = "SELECT * FROM time_table WHERE binary(s_id) LIKE ? ORDER BY res_date";
	        PreparedStatement pstmt=null;
	        ResultSet rs;
	        ArrayList<BookInfo> list = new ArrayList<BookInfo>();
	        
	        try {
	           pstmt= con.prepareStatement(sqlSt);
	           pstmt.setString(1,"%"+id+"%");
	           rs = pstmt.executeQuery();
	           while(rs.next()) {
	              BookInfo b=new BookInfo();
	              b.setS_id(rs.getString("s_id"));
	              b.setC_id(rs.getString("c_id"));
	              b.setSeati(rs.getString("seati"));
	              b.setRes_date(rs.getString("res_date"));
	              b.setRes_stime(rs.getString("res_stime"));
	              b.setRes_ftime(rs.getString("Res_ftime"));
	              list.add(b);
	              
	           }
	        } catch (SQLException e) {
	           // TODO Auto-generated catch block
	           e.printStackTrace();
	        }finally {
	           return list;
	        }
	        
	     }
	   
	 
	 //스터디룸 등록
	 public static int registerRoom(Connection con,String s_id,String s_roomName,String s_roomPrice,String s_roomPersonNum,String s_RPhoto) {
           
		      String st = "INSERT INTO room (s_id,s_roomName,s_roomPrice,s_roomPersonNum,s_RPhoto) VALUES (?,?,?,?,?)";

		      PreparedStatement pstmt=null;
		      int result=0;

		      try {
		         pstmt= con.prepareStatement(st);
		         
		         pstmt.setString(1,s_id);
		         pstmt.setString(2,s_roomName);
		         pstmt.setString(3,s_roomPrice);
		         pstmt.setString(4,s_roomPersonNum);
		         pstmt.setString(5,s_RPhoto);
		         
		         if(pstmt.executeUpdate()!=0){
	                  result++;
	              }

		         return result;
		   
		         
		      }catch (SQLException e) {
		         e.printStackTrace();
		      }
		      
		      return result;
		   
		   }
	   
	 //등록한 스터디룸 정보 불러오기
	   public static ArrayList<Room> RoomBook(Connection con, String s_id) { 
			String sqlSt = "SELECT * FROM room WHERE s_id=?";
			PreparedStatement pstmt=null;
			ResultSet rs;
			ArrayList<Room> list = new ArrayList<Room>();
			
			try {
				pstmt= con.prepareStatement(sqlSt);
				pstmt.setString(1, s_id);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Room r=new Room();
					r.setRoomName(rs.getString("s_roomName"));
					r.setRPhoto(rs.getString("s_RPhoto"));
					r.setRoomPrice(rs.getString("s_roomprice"));
					r.setRoomPersonNum(rs.getString("s_roomPersonNum"));
					list.add(r);
					
				}
		         
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				return list;
			}
			
		}
	   
	 //예약할 스터디룸 선택(1개)
	   public static ArrayList<Room> RoomSelect(Connection con, String s_id,String roomName) { 
			String sqlSt = "SELECT * FROM room WHERE s_id=? AND s_roomName=?";
			PreparedStatement pstmt=null;
			ResultSet rs;
			ArrayList<Room> list = new ArrayList<Room>();
			
			try {
				pstmt= con.prepareStatement(sqlSt);
				pstmt.setString(1, s_id);
				pstmt.setString(2, roomName);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Room r=new Room();
					r.setRoomName(rs.getString("s_roomName"));
					r.setRPhoto(rs.getString("s_RPhoto"));
					r.setRoomPrice(rs.getString("s_roomprice"));
					r.setRoomPersonNum(rs.getString("s_roomPersonNum"));
					list.add(r);
					
				}

		         
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				return list;
			}
			
		}
	   
	 //카페 스터디룸 예약시간 확인
	   public static ArrayList<timeList> roomTime(Connection con, String s_id,String roomName,String r_date) { 
			String sqlSt = "SELECT r_sTime,r_fTime FROM room_time_table WHERE fk_s_id=? AND fk_roomName=? AND r_date=?";
			PreparedStatement pstmt = null;
		      ResultSet rs;
		      ArrayList<timeList> list=new ArrayList<timeList>();
		      String start = "";
		      String finall = "";
		      String tamtam="예약된 시간이 없습니다.";
		      try {
		         pstmt = con.prepareStatement(sqlSt);
		         pstmt.setString(1, s_id);
		         pstmt.setString(2, roomName);
		         pstmt.setString(3,r_date);
		         rs = pstmt.executeQuery();
		         System.out.println(roomName);
		         System.out.println(r_date);
		   
		         while (rs.next()) {
		            timeList tl=new timeList();
		            start = Integer.toString(rs.getInt("r_sTime"));
		            finall = Integer.toString(rs.getInt("r_fTime"));
		            tamtam =start + "시-" + finall+"시";
		            tl.setTimeList(tamtam);
		            list.add(tl);
		         }System.out.println(tamtam);
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }finally {
		         return list;
		      }
		}
	   
	   //스터디룸 예약가능여부 확인 및 예약
	   public static String roomResult(Connection con, String s_id, String c_id,String r_date, int r_sTime,
		         int r_fTime,String roomName) { 
		      String st2="SELECT r_sTime,r_fTime FROM room_time_table WHERE fk_s_id=? AND fk_roomName=? AND r_date=?";
		      String st1 = "INSERT INTO room_time_table (fk_s_id, fk_c_id,r_date ,r_sTime ,r_fTime,fk_roomName) VALUES (?,?,?,?,?,?)";
		      PreparedStatement pstmt1 = null;
		      PreparedStatement pstmt2 = null;
		      
		      ResultSet rs=null;
		      int start = 0;
		      int finall = 0;
		      try {
		         pstmt2 = con.prepareStatement(st2);
		         pstmt2.setString(1, s_id);
		         pstmt2.setString(2, roomName);
		         pstmt2.setString(3, r_date);
		         rs = pstmt2.executeQuery();
		         
		         while (rs.next()) {
		            start = rs.getInt("r_sTime");
		            finall = rs.getInt("r_fTime");
		            System.out.println(start+ ", " +finall);
		            if((start<r_sTime&&r_sTime<finall)||(start<r_fTime&&r_fTime<finall)||(r_sTime<start&&start<r_fTime)||(r_sTime<finall&&finall<r_fTime)){
		             return "예약된 시간과 겹칩니다. 다시 입력해주세요.";
		            }else {
		               pstmt1 = con.prepareStatement(st1);
		               pstmt1.setString(1, s_id);
		               pstmt1.setString(2, c_id);
		               pstmt1.setString(3,r_date);
		               pstmt1.setInt(4, r_sTime);
		               pstmt1.setInt(5, r_fTime);
		               pstmt1.setString(6, roomName);
		               pstmt1.execute();
		               return "예약되었습니다.";
		            }
		         }
		         System.out.println(rs);
		         pstmt1 = con.prepareStatement(st1);
		         pstmt1.setString(1, s_id);
	               pstmt1.setString(2, c_id);
	               pstmt1.setString(3,r_date);
	               pstmt1.setInt(4, r_sTime);
	               pstmt1.setInt(5, r_fTime);
	               pstmt1.setString(6, roomName);
	               pstmt1.execute();
	               return "예약되었습니다.";
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		      return ""; 
		   }
	   
	// 카페 좌석예약시간 확인하기
	   public static ArrayList<timeList> seatTimeCheck(Connection con, String s_id, String seati, String date) { 
		      String sqlSt = "SELECT res_stime,res_ftime FROM time_table WHERE s_id=? AND seati=? And res_date=? ORDER BY res_stime";
		      PreparedStatement pstmt = null;
		      ResultSet rs;
		      ArrayList<timeList> list=new ArrayList<timeList>();
		      String start = "";
		      String finall = "";
		      String tamtam="예약된 시간이 없습니다.";
		      try {
		         pstmt = con.prepareStatement(sqlSt);
		         pstmt.setString(1, s_id);
		         pstmt.setString(2, seati);
		         pstmt.setString(3, date);
		         rs = pstmt.executeQuery();
		         while (rs.next()) {
		            timeList tl=new timeList();
		            start = Integer.toString(rs.getInt("res_stime"));
		            finall = Integer.toString(rs.getInt("res_ftime"));
		            tamtam =start + "시-" + finall+"시";
		            tl.setTimeList(tamtam);
		            list.add(tl);
		         }System.out.println(tamtam);
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }finally {
		         return list;
		      }
		      
		   }

		   // 좌석예약
		   public static String bookTime(Connection con, String s_id, String c_id, String seati, String res_date, int res_stime,
		         int res_ftime) {
		      String st2="SELECT res_stime,res_ftime FROM time_table WHERE s_id=? AND seati=? And res_date=?";
		      String st1 = "INSERT INTO time_table (s_id, c_id, seati, res_date ,res_stime ,res_ftime) VALUES (?,?,?,?,?,?)";
		      PreparedStatement pstmt1 = null;
		      PreparedStatement pstmt2 = null;
		      ResultSet rs;
		      int start = 0;
		      int finall = 0;
		      try {
		         pstmt2 = con.prepareStatement(st2);
		         pstmt2.setString(1, s_id);
		         pstmt2.setString(2, seati);
		         pstmt2.setString(3, res_date);
		         rs = pstmt2.executeQuery();
		         
		         while (rs.next()) {
		            start = rs.getInt("res_stime");
		            finall = rs.getInt("res_ftime");
		            System.out.println(start+ ", " +finall);
		            if((start<res_stime&&res_stime<finall)||(start<res_ftime&&res_ftime<finall)||(res_stime<start&&start<res_ftime)||(res_stime<finall&&finall<res_ftime)){
		             return "예약된 시간과 겹친다. 다시 입력";
		            }else {
		               pstmt1 = con.prepareStatement(st1);
		               pstmt1.setString(1, s_id);
		               pstmt1.setString(2, c_id);
		               pstmt1.setString(3, seati);
		               pstmt1.setString(4, res_date);
		               pstmt1.setInt(5, res_stime);
		               pstmt1.setInt(6, res_ftime);
		               pstmt1.execute();
		               return "예약되었습니다.";
		            }
		         }
		         pstmt1 = con.prepareStatement(st1);
	               pstmt1.setString(1, s_id);
	               pstmt1.setString(2, c_id);
	               pstmt1.setString(3, seati);
	               pstmt1.setString(4, res_date);
	               pstmt1.setInt(5, res_stime);
	               pstmt1.setInt(6, res_ftime);
	               pstmt1.execute();
	               return "예약되었습니다.";
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		      return ""; 
		   }
	   
		// 좌석 업로드
		   public static String seatUpload(Connection con,String s_id, int i) { 
			      String sqlSt = "SELECT s,status FROM seat WHERE s=? AND s_id=?";
			      PreparedStatement pstmt = null;
			      ResultSet rs;
			      String newS = "0";
			      int status=-1;

			      try {
			         pstmt = con.prepareStatement(sqlSt);
			         pstmt.setInt(1, i);
			         pstmt.setString(2, s_id);
			         rs = pstmt.executeQuery();
			         while (rs.next()) {
			            newS = rs.getString("s");
			            status=rs.getInt("status");
			            if(newS.equals("0")) //없는 좌석
			               return newS;
			            else if(status==1)//사용중인 상태
			               return "1";
			            else if(status==0)//좌석은 있는데 사용안하는 상태
			               return "2";
			            }
			            
			         }

			       catch (SQLException e) {
			         // TODO Auto-generated catch block
			         e.printStackTrace();
			      }
			      return "0";
			   }
		   
		   public static void createSeat(Connection con, String s_id, int s) {

			      String st = "INSERT INTO seat (s_id,s) VALUES (?,?)";

			      PreparedStatement pstmt = null;

			      try {
			     
			         pstmt = con.prepareStatement(st);

			         pstmt.setString(1, s_id);
			         pstmt.setInt(2, s);

			         pstmt.execute();

			      } catch (SQLException e) {

			         e.printStackTrace();
			      }

			   }
		   
		 //스태프가 좌석을 업로드할때
		   public static int updateSeatStatus(Connection con, String s_id, String s) {
			      
			      String st1="SELECT status FROM seat WHERE s_id=? AND s=?";
			      String st2 = "UPDATE seat SET status=? WHERE s_id=? AND s=?";
			      PreparedStatement pstmt1 = null;
			      PreparedStatement pstmt2 = null;
			      ResultSet rs1;
			      int status;
			      int check = -1;
			      try {
			         pstmt1 = con.prepareStatement(st1);
			         pstmt1.setString(1, s_id);
			         pstmt1.setString(2, s);
			         rs1 = pstmt1.executeQuery();
			         while(rs1.next()) { //찾았을때
			            status=rs1.getInt("status");
			            System.out.println(status);
			            if(status==0) {//사용중이지 않을때
			               pstmt2=con.prepareStatement(st2);
			               pstmt2.setInt(1, 1);//1로 업데이트
			               pstmt2.setString(2, s_id);
			               pstmt2.setString(3, s);
			               pstmt2.execute();
			               check=1;
			            }
			            else {
			               pstmt2=con.prepareStatement(st2);
			               pstmt2.setInt(1, 0);
			               pstmt2.setString(2, s_id);
			               pstmt2.setString(3, s);
			               pstmt2.execute();
			               check=0;
			            }
			         }
			         System.out.println("체크"+check);
			         return check;
			         
			      } catch (SQLException e) {
			         e.printStackTrace();
			      }
			      return check;
			   }
		   
		   //패널티 상태 확인
		   public static int lockStatus(Connection con, String c_id) {
		        String st = "SELECT count FROM customer_info WHERE c_id=?";
		        PreparedStatement pstmt = null;
		        ResultSet rs;
		        int unact = 0;
		        
		        try {
		           pstmt = con.prepareStatement(st);
		           pstmt.setString(1, c_id);
		 
		           rs = pstmt.executeQuery();
		              while (rs.next()) {
		                unact = rs.getInt("count");
		                System.out.print(unact);
		                return unact;
		              }
		              System.out.println(unact);
		            
		           } catch (SQLException e) {
		              
		              e.printStackTrace();
		           }
		           return unact;
		     }
		   
		   //문의글 등록
		   public static void askContent(Connection con, String c_id,String content ) {

			      String st = "INSERT INTO ask_Content (c_id,content) VALUES (?,?)";

			      PreparedStatement pstmt = null;

			      try {
			         pstmt = con.prepareStatement(st);

			         pstmt.setString(1, c_id);
			         pstmt.setString(2, content);
			         pstmt.execute();


			      } catch (SQLException e) {
			         e.printStackTrace();
			      }
			   }
		   
		   //고객정보 수정
		   public static int cModifyInfo(Connection con, String c_id, String c_passwd, String c_name, String c_phone) {
	            String st = "UPDATE customer_info SET c_passwd=?, c_name=?, c_phone=? WHERE c_id=?";

	            PreparedStatement pstmt = null;
	            int result=0;

	            try {
	               
	               pstmt = con.prepareStatement(st);
	               pstmt.setString(4, c_id);
	               pstmt.setString(1, c_passwd);
	               pstmt.setString(2, c_name);
	               pstmt.setString(3, c_phone);

	               result = pstmt.executeUpdate();
	               

	            } catch (SQLException e) {
	               e.printStackTrace();
	            } 
	            return result;
	         }
	      
		   //고객정보 검색
	      public static ArrayList<Modify> cModify(Connection con, String c_id) { 
	            String sqlSt = "SELECT * FROM customer_info WHERE c_id = ? ";
	            PreparedStatement pstmt = null;
	            ResultSet rs;
	            ArrayList<Modify> list = new ArrayList<Modify>();

	            try {
	               pstmt = con.prepareStatement(sqlSt);
	               pstmt.setString(1,c_id );
	               rs = pstmt.executeQuery();
	               while (rs.next()) {
	                  Modify m = new Modify();
	                  m.setC_id(rs.getString("c_id"));
	                  m.setC_passwd(rs.getString("c_passwd"));
	                  m.setC_name(rs.getString("c_name"));
	                  m.setC_phone(rs.getString("c_phone"));

	                  list.add(m);

	               }

	            } catch (SQLException e) {
	               e.printStackTrace();
	            } finally {
	               return list;
	            }

	         } 
	      
	      //관리회원 정보수정
	      public static int sModifyInfo(Connection con, String s_id, String s_passwd, String s_cafeName, String s_address) {
	            String st = "UPDATE staff_info SET s_passwd=?, s_cafeName=?, s_address=? WHERE s_id=?";

	            PreparedStatement pstmt = null;
	            int result=0;

	            try {
	               
	               pstmt = con.prepareStatement(st);
	               pstmt.setString(4, s_id);
	               pstmt.setString(1, s_passwd);
	               pstmt.setString(2, s_cafeName);
	               pstmt.setString(3, s_address);

	               result = pstmt.executeUpdate();
	               

	            } catch (SQLException e) {
	               e.printStackTrace();
	            } 
	            return result;
	         }
	      
	      //관리회원 정보 검색
	      public static ArrayList<Modify> sModify(Connection con, String s_id) { 
	            String sqlSt = "SELECT s_id, s_passwd, s_cafeName, s_address FROM staff_info WHERE s_id = ? ";
	            PreparedStatement pstmt = null;
	            ResultSet rs;
	            ArrayList<Modify> list = new ArrayList<Modify>();

	            try {
	               pstmt = con.prepareStatement(sqlSt);
	               pstmt.setString(1,s_id );
	               rs = pstmt.executeQuery();
	               while (rs.next()) {
	                  Modify m = new Modify();
	                  m.setS_id(rs.getString("s_id"));
	                  m.setS_passwd(rs.getString("s_passwd"));
	                  m.setS_cafeName(rs.getString("s_cafeName"));
	                  m.setS_address(rs.getString("s_address"));

	                  list.add(m);

	               }

	            } catch (SQLException e) {
	               
	               e.printStackTrace();
	            } finally {
	               return list;
	            }

	         } 
	      
	      //고객의 노쇼정보
	      public static ArrayList<Penalty> noshowList(Connection con, String c_id) {
	          String st = "SELECT * FROM noshow WHERE c_id Like ?";
	          PreparedStatement pstmt;
	          ResultSet rs;
	        
	          ArrayList<Penalty> list = new ArrayList<Penalty>();
	          try {
	             pstmt = con.prepareStatement(st);
	             pstmt.setString(1, "%"+c_id+"%");
	             rs = pstmt.executeQuery();
	             while (rs.next()) {
	       
	                Penalty p = new Penalty();
	                p.setS_id(rs.getString("s_id"));
	                p.setRes_date(rs.getString("res_date"));
	                list.add(p);
	             }

	          } catch (SQLException e) {
	             e.printStackTrace();
	          } finally {
	             return list;
	          }
	          
	       }
	      
	   // 패널티 버튼 누를경우 count증가
	      public static void penalty(Connection con, String c_id) {
	         String st = "UPDATE customer_info SET count=count+1 WHERE c_id=?";
	         PreparedStatement pstmt = null; 

	         try {
	            pstmt = con.prepareStatement(st);
	            pstmt.setString(1, c_id);

	            pstmt.execute();

	         } catch (SQLException e) {
	            e.printStackTrace();
	         } 
	      }
	      
	      // noshow 테이블에 값 넣기, 불러오기 
	      public static void penaltyState(Connection con, String s_id, String c_id, String res_date) {
	         String st = "INSERT INTO noshow (s_id, c_id, res_date) VALUES (?,?,?)";
	         PreparedStatement pstmt = null;
	         
	         try {
	            
	            pstmt = con.prepareStatement(st);
	            pstmt.setString(1, s_id);
	            pstmt.setString(2, c_id);
	            pstmt.setString(3, res_date);
	            System.out.println(c_id);

	            pstmt.execute();

	         } catch (SQLException e) {
	            e.printStackTrace();
	         } 
	      }
	      
	   //관리회원 아이디 찾기
	      public static String s_IDsearch(Connection con, String cafeName, String address) {
	          String sqlSt = "SELECT s_id FROM staff_info WHERE s_cafeName='" + cafeName + "' and s_address='" + address
	                + "'";
	          Statement stmt = null;
	          String s_id = null;
	          ResultSet rs;
	          try {
	             stmt = con.createStatement();
	             rs = stmt.executeQuery(sqlSt);
	             if (rs.next()) {
	                s_id = rs.getString(1);
	                return s_id;
	             }

	          } catch (SQLException e) {
	             e.printStackTrace();
	          } finally {

	             System.out.close();
	          }
	          return s_id;
	       }
	      
	   //관리회원 비밀번호 찾기
	       public static String s_PWsearch(Connection con, String s_id, String cafeName, String address) {
	          String sqlSt = "SELECT s_passwd FROM staff_info WHERE s_id= '" + s_id + "'and s_cafeName='" + cafeName
	                + "' and s_address='" + address + "'";
	          Statement stmt = null;
	          String s_passwd = null;
	          ResultSet rs;
	          try {
	             stmt = con.createStatement();
	             rs = stmt.executeQuery(sqlSt);
	             if (rs.next()) {
	                s_passwd = rs.getString(1);
	                return s_passwd;
	             }

	          } catch (SQLException e) {
	             e.printStackTrace();
	          } finally {

	             System.out.close();
	          }
	          return s_passwd;
	       }

	    // 고객 아이디 찾기
	       public static String c_IDsearch(Connection con, String c_name, String phoneNum) {
	          String sqlSt = "SELECT c_id FROM customer_info WHERE c_name= '" + c_name + "' and c_phone='" + phoneNum + "'";
	          Statement stmt = null;
	          String c_id = null;
	          ResultSet rs;
	          try {
	             stmt = con.createStatement();
	             rs = stmt.executeQuery(sqlSt);
	             if (rs.next()) {
	                c_id = rs.getString(1);
	                return c_id;
	             }

	          } catch (SQLException e) {
	             e.printStackTrace();
	          } finally {

	             System.out.close();
	          }
	          return c_id;
	       }

	    //고객 비밀번호 찾기
	       public static String c_PWsearch(Connection con, String c_id, String c_name, String phoneNum) {
	          String sqlSt = "SELECT c_passwd FROM customer_info WHERE c_id= '" + c_id + "'and c_name='" + c_name
	                + "' and c_phone='" + phoneNum + "'";

	          Statement stmt = null;
	          String c_passwd = null;
	          ResultSet rs;
	          try {
	             stmt = con.createStatement();
	             rs = stmt.executeQuery(sqlSt);
	             if (rs.next()) {
	                c_passwd = rs.getString(1);
	                return c_passwd;
	             }

	          } catch (SQLException e) {
	             e.printStackTrace();
	          } finally {

	             System.out.close();
	          }
	          return c_passwd;
	       }
	      
	      
	      
	


}
