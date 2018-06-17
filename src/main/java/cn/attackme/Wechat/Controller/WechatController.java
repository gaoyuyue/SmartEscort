package cn.attackme.Wechat.Controller;


import cn.attackme.Wechat.Dispatcher.EventDispatcher;
import cn.attackme.Wechat.Dispatcher.MsgDispatcher;
import cn.attackme.Wechat.Util.MessageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;

import static cn.attackme.Wechat.Util.MenuUtil.createMenu;
import static cn.attackme.Wechat.Util.SecurityUtil.isSignature;

/**
 * Created by arthurme on 2017/3/3.
 */
@RequestMapping("/Wechat")
@Controller
public class WechatController {

    /**
     * 验证，每次提交接口配置信息时调用
     * @param signature
     * @param timestamp
     * @param nonce
     * @param echostr
     * @return
     * @throws IOException
     */
    @ResponseBody
    @GetMapping("/")
    public String doGet(@RequestParam String signature,
                       @RequestParam String timestamp,
                       @RequestParam String nonce,
                       @RequestParam String echostr) throws IOException {
        if (isSignature(signature,timestamp,nonce)){
            createMenu();
            return echostr;
        }
        return null;
    }

    /**
     * 信息交互
     * @param request
     * @return
     * @throws Exception
     */
    @ResponseBody
    @PostMapping("/")
    public String doPost(HttpServletRequest request) throws Exception {
        Map<String, String> map= MessageUtil.parseXml(request);
        String msgType=map.get("MsgType");
        String msg;
        if(MessageUtil.REQ_MESSAGE_TYPE_EVENT.equals(msgType)){
            msg = EventDispatcher.processEvent(map);
        }else{
            msg = MsgDispatcher.processMessage(map);
        }
        return msg;
    }
}
