package com.kgc.controller;

import com.kgc.pojo.Access_control_device;
import com.kgc.pojo.Buiding;
import com.kgc.service.impl.Access_control_deviceServiceImpl;
import com.kgc.service.impl.BuidingServiceImpl;
import com.kgc.util.PageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class Access_control_deviceController {
    @Resource
    Access_control_deviceServiceImpl access_control_deviceService;
    @Resource
    BuidingServiceImpl buidingService;
    @RequestMapping(value = "/show",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public Map<String,Object> getAllShow(@RequestParam(value = "pageIndex",defaultValue = "1",required = false)Integer pageIndex, @RequestParam(value = "hospital_id",required = false)Integer hospital_id){
        Map<String,Object> map=new HashMap<>();
        PageUtil<Access_control_device> page = access_control_deviceService.getPage(pageIndex, 3, hospital_id);
        List<Buiding> list = buidingService.getAllForList();
        map.put("page",page);
        map.put("list",list);
        return map;
    }
    @RequestMapping(value = "/show2",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public List<Buiding> getList(){
        List<Buiding> list = buidingService.getAllForList();
        return list;
    }

    @RequestMapping("/getShow")
    public String getShow(Model model, @RequestParam(value = "pageIndex",defaultValue = "1",required = false)Integer pageIndex, @RequestParam(value = "hospital_id",required = false)Integer hospital_id){
        PageUtil<Access_control_device> page = access_control_deviceService.getPage(pageIndex, 3, hospital_id);
        model.addAttribute("page",page);
        return "index2";
    }
    @RequestMapping(value = "/updateA",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String getUpdate(Integer id,Integer status){
        Integer acce = access_control_deviceService.updateAcce(id, status);
        return "["+acce+"]";
    }
    @RequestMapping(value = "getToAdd")
    public String getToAddThing(){
        return "add";
    }
    @RequestMapping("/doadd")
    public String getToDoAdd(Access_control_device access_control_device){
        Integer acce = access_control_deviceService.AddAcce(access_control_device);
        if(acce>0){
            return "redirect:/getShow";
        }else{
            return "redirect:/getToAdd";
        }
    }


}
