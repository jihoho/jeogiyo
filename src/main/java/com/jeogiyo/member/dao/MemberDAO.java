package com.jeogiyo.member.dao;

import com.jeogiyo.member.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Mapper
public interface MemberDAO {
    public String selectOverlappedID(Map<String,String> idMap) throws DataAccessException;

    public void insertNewMember(MemberVO memberVO) throws DataAccessException;

    public MemberVO login(Map<String, String> loginMap) throws  DataAccessException;


    public void updateMemberByIdAndType(MemberVO memberVO) throws DataAccessException;
}
