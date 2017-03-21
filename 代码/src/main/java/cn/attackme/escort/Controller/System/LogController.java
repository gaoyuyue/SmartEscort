package cn.attackme.escort.Controller.System;


import cn.attackme.escort.Model.Log;
import cn.attackme.escort.Service.LogService;
import cn.attackme.escort.Utils.PageResults;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/Log")
public class LogController {
    @Autowired
    private LogService logService;

    /**
     * 日志统计界面
     *
     * @return 日志统计界面
     */
    @RequiresRoles("schoolAdmin")
    @GetMapping("/")
    public String logPage() {
        return "/System/Log/Log";
    }

    /**
     * 获得日志的错误信息，日志条数
     *
     * @return json数据
     */
    @RequiresRoles("schoolAdmin")
    @GetMapping("/LogInfo")
    @ResponseBody
    @Cacheable(value = "getLogInfo", keyGenerator = "customKeyGenerator")
    public Map<String, Long> getLogInfo() {
        Map<String, Long> map = new HashMap<>();
        long LogUtilsCount =
                logService.getExceptionCountByCallerFilename("LogUtils.java");//Controller出了异常
        long LogAspectCount =
                logService.getExceptionCountByCallerFilename("LogAspect.java");//自定义类异常
        long totalCount =
                logService.getExceptionCount();
        Long otherCount = totalCount - LogAspectCount - LogUtilsCount;
        map.put("totalCount", totalCount);
        map.put("LogUtilsCount", LogUtilsCount);
        map.put("LogAspectCount", LogAspectCount);
        map.put("otherCount", otherCount);
        return map;
    }

    /**
     * 日志分页查询
     *
     * @param pageNumber 页码
     * @param pageSize   每页大小
     * @return json数据
     */
    @RequiresRoles("schoolAdmin")
    @GetMapping("/LogByPage/pageNumber/{pageNumber}/pageSize/{pageSize}")
    @ResponseBody
    @Cacheable(value = "getLogByPage", keyGenerator = "customKeyGenerator")
    public PageResults<Log> getLogByPage(@PathVariable int pageNumber,
                                         @PathVariable int pageSize) {
        return logService.getListByPage(pageNumber, pageSize);
    }

}
