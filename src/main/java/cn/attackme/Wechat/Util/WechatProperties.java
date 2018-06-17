package cn.attackme.Wechat.Util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * Created by arthurme on 2017/3/4.
 *
 * 参数类
 * 在启动项目时自动注入
 */
@Component
public class WechatProperties {
    /**
     * 填入Properties文件中的配置
     */
    public static String appid;
    public static String AppSecret;
    public static String tokenUrl;
    public static String mediaUrl;
    public static String OpenidUserinfoUrl;
    public static String ticketUrl;
    public static String menuUrl;
    public static String authorizeUrl;
    public static String OAuth2Url;
    public static String setIndustry;
    public static String getTemplate;
    public static String sendTemplate;
    /**
     * 执行更新任务时填入
     */
    public static String access_token;
    public static String jsapi_ticket;


    @Value("#{configProperties['appid']}")
    public void setAppid(String appid) {
        WechatProperties.appid = appid;
    }

    @Value("#{configProperties['AppSecret']}")
    public void setAppSecret(String appSecret) {
        AppSecret = appSecret;
    }

    @Value("#{configProperties['tokenUrl']}")
    public void setTokenUrl(String tokenUrl) {
        WechatProperties.tokenUrl = tokenUrl;
    }

    @Value("#{configProperties['mediaUrl']}")
    public void setMediaUrl(String mediaUrl) {
        WechatProperties.mediaUrl = mediaUrl;
    }

    @Value("#{configProperties['OpenidUserinfoUrl']}")
    public void setOpenidUserinfoUrl(String openidUserinfoUrl) {
        OpenidUserinfoUrl = openidUserinfoUrl;
    }

    @Value("#{configProperties['ticketUrl']}")
    public void setTicketUrl(String ticketUrl) {
        WechatProperties.ticketUrl = ticketUrl;
    }

    @Value("#{configProperties['menuUrl']}")
    public void setMenuUrl(String menuUrl) {
        WechatProperties.menuUrl = menuUrl;
    }

    @Value("#{configProperties['authorizeUrl']}")
    public void setAuthorizeUrl(String authorizeUrl) {
        WechatProperties.authorizeUrl = authorizeUrl;
    }

    @Value("#{configProperties['OAuth2Url']}")
    public void setOAuth2Url(String OAuth2Url) {
        WechatProperties.OAuth2Url = OAuth2Url;
    }

    @Value("#{configProperties['setIndustry']}")
    public void setSetIndustry(String setIndustry) {
        WechatProperties.setIndustry = setIndustry;
    }

    @Value("#{configProperties['getTemplate']}")
    public void setGetTemplate(String getTemplate) {
        WechatProperties.getTemplate = getTemplate;
    }

    @Value("#{configProperties['sendTemplate']}")
    public void setSendTemplate(String sendTemplate) {
        WechatProperties.sendTemplate = sendTemplate;
    }
}
