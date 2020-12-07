package com.jeogiyo.member.dao;

import com.jeogiyo.member.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("memberDAO")
public interface MemberDAO {
    public String selectOverlappedID(String id) throws DataAccessException;

    public void insertNewMember(MemberVO memberVO) throws DataAccessException;
}
