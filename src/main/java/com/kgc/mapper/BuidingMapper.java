package com.kgc.mapper;

import com.kgc.pojo.Buiding;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BuidingMapper {
    List<Buiding> getAllForList();
}
