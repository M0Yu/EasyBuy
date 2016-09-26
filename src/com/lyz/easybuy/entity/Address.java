package com.lyz.easybuy.entity;

public class Address {
    private Integer adrrid;

    private String province;

    private String city;

    private String area;

    private String street;

    private String receiveuser;

    private String phone;

    private Integer usrid;

    public Integer getAdrrid() {
        return adrrid;
    }

    public void setAdrrid(Integer adrrid) {
        this.adrrid = adrrid;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street == null ? null : street.trim();
    }

    public String getReceiveuser() {
        return receiveuser;
    }

    public void setReceiveuser(String receiveuser) {
        this.receiveuser = receiveuser == null ? null : receiveuser.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getUsrid() {
        return usrid;
    }

    public void setUsrid(Integer usrid) {
        this.usrid = usrid;
    }
}