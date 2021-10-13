package com.kgc.mapper;

import com.kgc.pojo.Access_control_device;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface Access_control_deviceMapper {
    List<Access_control_device> getAll(@Param("pageIndex")Integer pageIndex,@Param("pageSize")Integer pageSize,@Param("hospital_id")Integer hospital_id);
    Integer getCount(@Param("hospital_id")Integer hospital_id);
    Integer updateAcce(@Param("id") Integer id,@Param("status") Integer status);
    Integer AddAcce(Access_control_device access_control_device);
}
