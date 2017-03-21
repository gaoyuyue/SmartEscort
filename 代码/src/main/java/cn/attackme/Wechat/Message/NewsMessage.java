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
public class NewsMessage extends BaseMessage {
    private String Title;
}
