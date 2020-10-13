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
        }catch (Exception e1){
            e1.printStackTrace();
            try{
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
            String sql = "select * from rentcar order by DESC cno";
            pstmt = con.prepareStatement(sql);
            res = pstmt.executeQuery();
            int count=0;

            while (res!=null){
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

                if(count > 3) break; //반복문 탈출
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
}