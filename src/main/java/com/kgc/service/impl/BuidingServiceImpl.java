package com.kgc.service.impl;

import com.kgc.mapper.BuidingMapper;
import com.kgc.pojo.Buiding;
import com.kgc.service.BuidingService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BuidingServiceImpl implements BuidingService {
    @Resource
    BuidingMapper buidingMapper;
    @Override
    public List<Buiding> getAllForList() {
        return buidingMapper.getAllForList();
    }
}
