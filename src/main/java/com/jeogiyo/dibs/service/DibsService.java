package com.jeogiyo.dibs.service;

import com.jeogiyo.dibs.vo.DibsVO;

import java.util.HashMap;
import java.util.Map;

public interface DibsService {
    public String isDibsOn(DibsVO dibsVO) throws Exception;

    public void addDibs(DibsVO dibsVO) throws Exception;

    public void deleteDibs(DibsVO dibsVO) throws Exception;
}
