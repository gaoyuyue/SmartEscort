package cn.attackme.Wechat.Util;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

import static cn.attackme.Wechat.Util.HttpUtil.sendGet;

/**
 * Created by arthurme on 2017/3/6.
 */
public class OAuth2Util {
    /**
     * 请求获取openid
     * @param appid
     * @param secret
     * @param code
     * @return
     * @throws Exception
     */
    public static String getOAuthOpenId(String appid, String secret, String code ) throws Exception {
        String requestUrl = "https://api.weixin.qq.com/sns/oauth2/access_token";
        Map<String,String> params = new HashMap<>();
        params.put("appid", appid);
        params.put("secret", secret);
        params.put("code", code);
        params.put("grant_type","authorization_code");

        String json = sendGet(requestUrl,params);
        JSONObject jsonObject = new JSONObject(json);

        // 如果请求成功
        if (null != jsonObject) {
            return jsonObject.getString("openid");
        }
        return null;
    }
}
