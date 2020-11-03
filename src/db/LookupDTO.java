package db;

public class LookupDTO {
    private String cname;
    private int price;
    private String img;
    private int qty;
    private int rent_term;
    private String rent_date;
    private int ins;
    private int wifi;
    private int nav;
    private int seat;

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public int getRent_term() {
        return rent_term;
    }

    public void setRent_term(int rent_term) {
        this.rent_term = rent_term;
    }

    public String getRent_date() {
        return rent_date;
    }

    public void setRent_date(String rent_date) {
        this.rent_date = rent_date;
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
