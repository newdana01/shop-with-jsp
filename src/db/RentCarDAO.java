package db;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class RentCarDAO {
    Connection con;
    DataSource dataSource;
    PreparedStatement pstmt;
    ResultSet res;

    public void getCon(){
        try{
            Context context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mysqlDatabase");
            con = dataSource.getConnection();

            pstmt = con.prepareStatement("USE rentcar");
            pstmt.execute();
            pstmt.clearParameters();

        }catch (Exception e1){
            e1.printStackTrace();
            try{
                if(pstmt!=null) pstmt.close();
                if(con!=null) con.close();
            }catch (Exception e2){
                e2.printStackTrace();
            }
        }
    }

    public ArrayList<RentCarDTO> getSelectCar() {
        ArrayList<RentCarDTO> rentCarDTOS = new ArrayList<>();

        getCon();
        try{
            //쿼리 차후 수정 가능
            String sql = "SELECT * FROM rentcar ORDER BY cno DESC";
            pstmt = con.prepareStatement(sql);
            res = pstmt.executeQuery();
            int count=0;

            while (res.next()){
                RentCarDTO rentCarDTO = new RentCarDTO();
                rentCarDTO.setCno(res.getInt(1));
                rentCarDTO.setCname(res.getString(2));
                rentCarDTO.setCategory(res.getInt(3));
                rentCarDTO.setPrice(res.getInt(4));
                rentCarDTO.setUsepeople(res.getInt(5));
                rentCarDTO.setCompany(res.getString(6));
                rentCarDTO.setImg(res.getString(7));
                rentCarDTO.setInfo(res.getString(8));

                rentCarDTOS.add(rentCarDTO);
                count++;

                if(count > 2) break; //반복문 탈출
            }
        }catch (Exception e1){
            e1.printStackTrace();
        }finally {
            try{
                if(res!=null) res.close();
                if(pstmt!=null) pstmt.close();
                if(con!=null) con.close();
            }catch (Exception e2){
                e2.printStackTrace();
            }
        }
        return rentCarDTOS;
    }

    public ArrayList<RentCarDTO> getCategoryList(int category) {
        ArrayList<RentCarDTO> rentCarDTOS = new ArrayList<>();

        getCon();
        try{
            String sql="SELECT * FROM rentcar WHERE category=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, category);
            res = pstmt.executeQuery();

            while(res.next()){
                RentCarDTO rentCarDTO = new RentCarDTO();
                rentCarDTO.setCno(res.getInt(1));
                rentCarDTO.setCname(res.getString(2));
                rentCarDTO.setCategory(res.getInt(3));
                rentCarDTO.setPrice(res.getInt(4));
                rentCarDTO.setUsepeople(res.getInt(5));
                rentCarDTO.setCompany(res.getString(6));
                rentCarDTO.setImg(res.getString(7));
                rentCarDTO.setInfo(res.getString(8));

                rentCarDTOS.add(rentCarDTO);
            }
        }catch (Exception e1){
            e1.printStackTrace();
        }finally {
            try {
                if(res!=null) res.close();
                if(pstmt!=null) pstmt.close();
                if(con!=null) con.close();
            }catch (Exception e2){
                e2.printStackTrace();
            }
        }
        return rentCarDTOS;
    }

    public ArrayList<RentCarDTO> getAllCar() {
        ArrayList<RentCarDTO> rentCarDTOS = new ArrayList<>();

        getCon();
        try{
            String sql="SELECT * FROM rentcar";
            pstmt = con.prepareStatement(sql);
            res = pstmt.executeQuery();

            while(res.next()){
                RentCarDTO rentCarDTO = new RentCarDTO();
                rentCarDTO.setCno(res.getInt(1));
                rentCarDTO.setCname(res.getString(2));
                rentCarDTO.setCategory(res.getInt(3));
                rentCarDTO.setPrice(res.getInt(4));
                rentCarDTO.setUsepeople(res.getInt(5));
                rentCarDTO.setCompany(res.getString(6));
                rentCarDTO.setImg(res.getString(7));
                rentCarDTO.setInfo(res.getString(8));

                rentCarDTOS.add(rentCarDTO);
            }
        }catch (Exception e1){
            e1.printStackTrace();
        }finally {
            try {
                if(res!=null) res.close();
                if(pstmt!=null) pstmt.close();
                if(con!=null) con.close();
            }catch (Exception e2){
                e2.printStackTrace();
            }
        }
        return rentCarDTOS;
    }

    public RentCarDTO getCarInfo(int cno) {
        RentCarDTO rentCarDTO = new RentCarDTO();

        getCon();
        try{
            String sql = "SELECT * FROM rentcar WHERE cno=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,cno);
            res = pstmt.executeQuery();

            if(res.next()){
                rentCarDTO.setCno(res.getInt(1));
                rentCarDTO.setCname(res.getString(2));
                rentCarDTO.setCategory(res.getInt(3));
                rentCarDTO.setPrice(res.getInt(4));
                rentCarDTO.setUsepeople(res.getInt(5));
                rentCarDTO.setCompany(res.getString(6));
                rentCarDTO.setImg(res.getString(7));
                rentCarDTO.setInfo(res.getString(8));
            }
        }catch (Exception e1){
            e1.printStackTrace();
        }finally {
            try {
                if(res!=null) res.close();
                if(pstmt!=null) pstmt.close();
                if(con!=null) con.close();
            }catch (Exception e2){
                e2.printStackTrace();
            }
        }
        return rentCarDTO;
    }

    public int isExist(String id, String pw) {
        int result=0; //0이면 회원 없음

        getCon();
        try{
            String sql="SELECT count(*) FROM car_member WHERE id=? AND pass =?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            res = pstmt.executeQuery();

            if(res.next()){
                result = res.getInt(1); //0 또는 1 값 저장됨
            }
        }catch (Exception e1){
            e1.printStackTrace();
        }finally {
            try {
                if(res!=null) res.close();
                if(pstmt!=null) pstmt.close();
                if(con!=null) con.close();
            }catch (Exception e2){
                e2.printStackTrace();
            }
        }
        return result;
    }

    public void insertReservation(ReservationDTO rDTO, int totalCost) { //예약정보를 저장하는 메서드
        getCon();
        try{
            String sql="INSERT INTO car_reservation VALUES (0, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, rDTO.getCno());
            pstmt.setString(2, rDTO.getId());
            pstmt.setInt(3, totalCost);
            pstmt.setInt(4, rDTO.getQty());
            pstmt.setInt(5, rDTO.getRent_term());
            pstmt.setString(6, rDTO.getRent_date());
            pstmt.setInt(7, rDTO.getIns());
            pstmt.setInt(8, rDTO.getWifi());
            pstmt.setInt(9, rDTO.getNav());
            pstmt.setInt(10, rDTO.getSeat());

            pstmt.executeUpdate();
        }catch (Exception e1){
            e1.printStackTrace();
        }finally {
            try {
                if(res!=null) res.close();
                if(pstmt!=null) pstmt.close();
                if(con!=null) con.close();
            }catch (Exception e2){
                e2.printStackTrace();
            }
        }
    }

    public ArrayList<LookupDTO> getAllReservation(String id) {
        ArrayList<LookupDTO> cDTO = new ArrayList<>();
        LookupDTO bean = null;

        getCon();
        try{
            String sql = "SELECT rno, cname, total_cost, img, qty, rent_term, rent_date, ins, wifi, nav, seat "
                    + "FROM rentcar NATURAL JOIN car_reservation WHERE NOW() < DATE_FORMAT(rent_date, '%Y%m%d') "
                    + "AND id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            res = pstmt.executeQuery();

            while (res.next()){
                bean = new LookupDTO();
                bean.setRno(res.getInt(1));
                bean.setCname(res.getString(2));
                bean.setTotal_cost(res.getInt(3));
                bean.setImg(res.getString(4));
                bean.setQty(res.getInt(5));
                bean.setRent_term(res.getInt(6));
                bean.setRent_date(res.getString(7));
                bean.setIns(res.getInt(8));
                bean.setWifi(res.getInt(9));
                bean.setNav(res.getInt(10));
                bean.setSeat(res.getInt(11));
                cDTO.add(bean);
            }
        }catch (Exception e1){
            e1.printStackTrace();
        }finally {
            try {
                if(res!=null) res.close();
                if(pstmt!=null) pstmt.close();
                if(con!=null) con.close();
            }catch (Exception e2){
                e2.printStackTrace();
            }
        }

        return cDTO;
    }

    public void delReservation(int rno) {
        getCon();

        try{
            String sql = "DELETE FROM car_reservation WHERE rno = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, rno);
            pstmt.executeUpdate();
        }catch (Exception e1){
            e1.printStackTrace();
        }finally {
            try{
                if(pstmt!=null) pstmt.close();
                if(con!=null) con.close();
            }catch (Exception e2){
                e2.printStackTrace();
            }
        }
    }
}
