package db;

public class ReservationDTO {
    private int rno;
    private int cno;
    private String id;
    private String rent_date; //대여 날짜
    private String return_date;
    private int ins;
    private int wifi;
    private int nav;
    private int seat;

    public int getRno() {
        return rno;
    }

    public void setRno(int rno) {
        this.rno = rno;
    }

    public int getCno() {
        return cno;
    }

    public void setCno(int cno) {
        this.cno = cno;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRent_date() {
        return rent_date;
    }

    public void setRent_date(String rent_date) {
        this.rent_date = rent_date;
    }

    public String getReturn_date() {
        return return_date;
    }

    public void setReturn_date(String return_date) {
        this.return_date = return_date;
    }

    public int getIns() {
        return ins;
    }

    public void setIns(int ins) {
        this.ins = ins;
    }

    public int getWifi() {
        return wifi;
    }

    public void setWifi(int wifi) {
        this.wifi = wifi;
    }

    public int getNav() {
        return nav;
    }

    public void setNav(int nav) {
        this.nav = nav;
    }

    public int getSeat() {
        return seat;
    }

    public void setSeat(int seat) {
        this.seat = seat;
    }
}
