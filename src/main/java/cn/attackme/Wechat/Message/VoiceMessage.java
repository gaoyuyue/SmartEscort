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
public class VoiceMessage extends BaseMessage {
    // 媒体 ID
    private String MediaId;
    // 语音格式
    private String Format;
}
