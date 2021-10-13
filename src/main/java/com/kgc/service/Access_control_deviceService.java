package com.kgc.service;

import com.kgc.pojo.Access_control_device;
import com.kgc.util.PageUtil;
import org.apache.ibatis.annotations.Param;

public interface Access_control_deviceService {
    PageUtil<Access_control_device> getPage(Integer pageIndex, Integer pageSize, Integer hospital_id);
    Integer updateAcce(Integer id,Integer status);
    Integer AddAcce(Access_control_device access_control_device);
}
