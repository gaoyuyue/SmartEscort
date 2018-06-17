package cn.attackme.Wechat.Controller;

import cn.attackme.Wechat.Util.WechatProperties;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

import static cn.attackme.Wechat.Util.OAuth2Util.getOAuthOpenId;
import static org.apache.shiro.SecurityUtils.getSubject;

/**
 * Created by arthurme on 2017/3/6.
 */
@RequestMapping("/OAuth2")
@Controller
public class OAuth2Controller {
    /**
     * OAuth2认证获取openid
     * @param code
     * @param state
     * @param httpSession
     * @return
     * @throws Exception
     */
    @GetMapping("/")
    public String getOpenId(@RequestParam String code,
                            @RequestParam String state,
                            HttpSession httpSession) throws Exception {

        if(null != code && !"".equals(code)) {
            //根据code换取openId
            if (null!=getSubject().getPrincipal())
                return "redirect:"+state;
            String openId = getOAuthOpenId(WechatProperties.appid, WechatProperties.AppSecret, code);
            if (!"".equals(openId) && null != openId) {
                httpSession.setAttribute("openid",openId);
                httpSession.setAttribute("state",state);
                return "redirect:/Account/OAuth2";
            }
        }
        return "/403.jsp";
    }
}
