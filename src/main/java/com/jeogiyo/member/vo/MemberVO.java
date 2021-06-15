package com.jeogiyo.member.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Component("memberVO")
public class MemberVO {
    private String id;
    private String pw;
    private String type;
    private String nickname;
    private String hp;
    private String isDelete;
    private String salt;


}

