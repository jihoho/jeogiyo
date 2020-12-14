package com.jeogiyo.member.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Component;


@Getter
@Setter
@ToString
@Component("memberVO")
public class MemberVO {
    private String member_id;
    private String member_pw;
    private String member_type;
    private String nick_name;
    private String hp;
    private String del_yn;


}
