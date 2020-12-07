package com.jeogiyo.member.vo;

public class MemberVO {
    private String member_id;
    private String member_pw;
    private String member_name;
    private String member_gender;
    private String tel1;
    private String tel2;
    private String tel3;
    private String hp1;
    private String hp2;
    private String hp3;
    private String smssts_yn;
    private String email1;
    private String email2;
    private String emailsts_yn;
    private String zipcode;
    private String road_address;
    private String jibeon_address;
    private String detail_address;
    private String join_date;
    private String del_yn;
    private String birth_y;
    private String birth_m;
    private String birth_d;
    private String birth_gn;

    @Override
    public String toString() {
        return "MemberVO{" +
                "member_id='" + member_id + '\'' +
                ", member_pw='" + member_pw + '\'' +
                ", member_name='" + member_name + '\'' +
                ", member_gender='" + member_gender + '\'' +
                ", tel1='" + tel1 + '\'' +
                ", tel2='" + tel2 + '\'' +
                ", tel3='" + tel3 + '\'' +
                ", hp1='" + hp1 + '\'' +
                ", hp2='" + hp2 + '\'' +
                ", hp3='" + hp3 + '\'' +
                ", smssts_yn='" + smssts_yn + '\'' +
                ", email1='" + email1 + '\'' +
                ", email2='" + email2 + '\'' +
                ", emailsts_yn='" + emailsts_yn + '\'' +
                ", zipcode='" + zipcode + '\'' +
                ", road_address='" + road_address + '\'' +
                ", jibeon_address='" + jibeon_address + '\'' +
                ", detail_address='" + detail_address + '\'' +
                ", join_date='" + join_date + '\'' +
                ", del_yn='" + del_yn + '\'' +
                ", birth_y='" + birth_y + '\'' +
                ", birth_m='" + birth_m + '\'' +
                ", birth_d='" + birth_d + '\'' +
                ", birth_gn='" + birth_gn + '\'' +
                '}';
    }

    public String getSmssts_yn() {
        return smssts_yn;
    }

    public void setSmssts_yn(String smssts_yn) {
        this.smssts_yn = smssts_yn;
    }

    public String getEmailsts_yn() {
        return emailsts_yn;
    }

    public void setEmailsts_yn(String emailsts_yn) {
        this.emailsts_yn = emailsts_yn;
    }

    public String getDel_yn() {
        return del_yn;
    }

    public void setDel_yn(String del_yn) {
        this.del_yn = del_yn;
    }

    public String getMember_id() {
        return member_id;
    }

    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }

    public String getMember_pw() {
        return member_pw;
    }

    public void setMember_pw(String member_pw) {
        this.member_pw = member_pw;
    }

    public String getMember_name() {
        return member_name;
    }

    public void setMember_name(String member_name) {
        this.member_name = member_name;
    }

    public String getMember_gender() {
        return member_gender;
    }

    public void setMember_gender(String member_gender) {
        this.member_gender = member_gender;
    }

    public String getTel1() {
        return tel1;
    }

    public void setTel1(String tel1) {
        this.tel1 = tel1;
    }

    public String getTel2() {
        return tel2;
    }

    public void setTel2(String tel2) {
        this.tel2 = tel2;
    }

    public String getTel3() {
        return tel3;
    }

    public void setTel3(String tel3) {
        this.tel3 = tel3;
    }

    public String getHp1() {
        return hp1;
    }

    public void setHp1(String hp1) {
        this.hp1 = hp1;
    }

    public String getHp2() {
        return hp2;
    }

    public void setHp2(String hp2) {
        this.hp2 = hp2;
    }

    public String getHp3() {
        return hp3;
    }

    public void setHp3(String hp3) {
        this.hp3 = hp3;
    }



    public String getEmail1() {
        return email1;
    }

    public void setEmail1(String email1) {
        this.email1 = email1;
    }

    public String getEmail2() {
        return email2;
    }

    public void setEmail2(String email2) {
        this.email2 = email2;
    }



    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getRoad_address() {
        return road_address;
    }

    public void setRoad_address(String road_address) {
        this.road_address = road_address;
    }

    public String getJibeon_address() {
        return jibeon_address;
    }

    public void setJibeon_address(String jibeon_address) {
        this.jibeon_address = jibeon_address;
    }

    public String getDetail_address() {
        return detail_address;
    }

    public void setDetail_address(String detail_address) {
        this.detail_address = detail_address;
    }

    public String getJoin_date() {
        return join_date;
    }

    public void setJoin_date(String join_date) {
        this.join_date = join_date;
    }



    public String getBirth_y() {
        return birth_y;
    }

    public void setBirth_y(String birth_y) {
        this.birth_y = birth_y;
    }

    public String getBirth_m() {
        return birth_m;
    }

    public void setBirth_m(String birth_m) {
        this.birth_m = birth_m;
    }

    public String getBirth_d() {
        return birth_d;
    }

    public void setBirth_d(String birth_d) {
        this.birth_d = birth_d;
    }

    public String getBirth_gn() {
        return birth_gn;
    }

    public void setBirth_gn(String birth_gn) {
        this.birth_gn = birth_gn;
    }
}
