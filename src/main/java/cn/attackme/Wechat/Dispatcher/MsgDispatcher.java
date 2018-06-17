package cn.attackme.Wechat.Dispatcher;

import cn.attackme.Wechat.Message.TextMessage;
import cn.attackme.Wechat.Util.MessageUtil;

import java.util.Map;

import static cn.attackme.Wechat.Util.MessageUtil.mapToMessage;

/**
 * Created by arthurme on 2017/3/3.
 */
public class MsgDispatcher {
    public static String processMessage(Map<String, String> map) {
        if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) { // 文本消息
            TextMessage txtMsg = new TextMessage();
            mapToMessage(txtMsg,map, MessageUtil.REQ_MESSAGE_TYPE_TEXT);
            txtMsg.setContent("你好，这里是高语越个人账号！");
            return MessageUtil.textMessageToXml(txtMsg);
        }

        if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) { // 图片消息
            System.out.println("==============这是图片消息！");
        }

        if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)) { // 链接消息
            System.out.println("==============这是链接消息！");
        }

        if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)) { // 位置消息
            System.out.println("==============这是位置消息！");
        }

        if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_VIDEO)) { // 视频消息
            System.out.println("==============这是视频消息！");
        }

        if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)) { // 语音消息
            System.out.println("==============这是语音消息！");
        }

        return null;
    }
}
