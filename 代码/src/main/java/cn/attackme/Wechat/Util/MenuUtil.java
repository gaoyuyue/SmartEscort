package cn.attackme.Wechat.Util;

import cn.attackme.Wechat.Menu.ClickButton;
import cn.attackme.Wechat.Menu.ViewButton;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;

/**
 * Created by arthurme on 2017/3/4.
 */
public class MenuUtil {
    /**
     * 创建菜单
     * 每次提交接口配置信息时调用
     * @throws IOException
     */
    public static void createMenu() throws IOException {
        String foreUrl = WechatProperties.authorizeUrl+"?appid="+
                WechatProperties.appid+
                "&redirect_uri="+
                WechatProperties.OAuth2Url+
                "&response_type=code&scope=snsapi_base&state=";
        String backUrl = "#wechat_redirect";
        ClickButton cbDescr=new ClickButton();
        cbDescr.setKey("description");
        cbDescr.setName("使用说明");
        cbDescr.setType("click");

        ClickButton cbConn=new ClickButton();
        cbConn.setKey("connectUs");
        cbConn.setName("关于我们");
        cbConn.setType("click");

        ViewButton vbPost=new ViewButton();
        vbPost.setUrl(foreUrl+"/LovePackage/Post"+backUrl);
        vbPost.setName("发布任务");
        vbPost.setType("view");

        ViewButton vbGet=new ViewButton();
        vbGet.setUrl(foreUrl+"/LovePackage/Get"+backUrl);
        vbGet.setName("领取任务");
        vbGet.setType("view");

        ViewButton vbPerson=new ViewButton();
        vbPerson.setUrl(foreUrl+"/LovePackage/Person"+backUrl);
        vbPerson.setName("个人中心");
        vbPerson.setType("view");

        JSONArray sub_button=new JSONArray();
        sub_button.put(0,new JSONObject(vbPost));
        sub_button.put(1,new JSONObject(vbGet));
        sub_button.put(2,new JSONObject(vbPerson));


        JSONObject buttonOne=new JSONObject();
        buttonOne.put("name", "全部功能");
        buttonOne.put("sub_button", sub_button);

        JSONArray button=new JSONArray();
        button.put(buttonOne);
        button.put(new JSONObject(cbDescr));
        button.put(new JSONObject(cbConn));

        JSONObject menuJson=new JSONObject();
        menuJson.put("button", button);

        String url=WechatProperties.menuUrl+WechatProperties.access_token;
        String rs=HttpUtil.sendPostBuffer(url,menuJson.toString());
    }
}
