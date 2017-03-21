package cn.attackme.Wechat.Message;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created by arthurme on 2017/3/3.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TextMessage extends BaseMessage {
    // 消息内容
    private String Content;
}
