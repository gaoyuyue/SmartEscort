package cn.attackme.Wechat.Task;

import cn.attackme.Wechat.Util.WechatProperties;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.Scheduled;

import java.util.HashMap;
import java.util.Map;

import static cn.attackme.Wechat.Util.HttpUtil.sendGet;

/**
 * Created by arthurme on 2017/3/4.
 */
@Configuration
public class Update {
    /**
     * 定时任务
     * 每隔118分钟获取一次
     * @throws Exception
     */
    @Scheduled(cron="0 */58 * * * ? ")
//    @Scheduled(cron="0 0 0 */1 * ? ")
//    @Scheduled(cron = "0 */2 * * * ? ")
    public void getToken() throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, String> params = new HashMap<String, String>();

        //获取token执行体
        params.put("grant_type", "client_credential");
        params.put("appid", WechatProperties.appid);
        params.put("secret", WechatProperties.AppSecret);
        String jstoken = sendGet(
                WechatProperties.tokenUrl, params);
        Map<String,String> tokenMap = objectMapper.readValue(jstoken,Map.class);
        String access_token = tokenMap.get("access_token");
        WechatProperties.access_token =  access_token;

        //获取jsticket的执行体
        params.clear();
        params.put("access_token", access_token);
        params.put("type", "jsapi");
        String jsticket = sendGet(
                WechatProperties.ticketUrl, params);
        Map<String,String> ticketMap = objectMapper.readValue(jsticket,Map.class);
        String jsapi_ticket = ticketMap.get("ticket");
        WechatProperties.jsapi_ticket = jsapi_ticket;
    }
}
