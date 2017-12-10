package cn.attackme.Wechat.Message;

import lombok.Data;

import java.util.Map;

/**
 * Created by arthurme on 2017/3/10.
 */
@Data
public class TemplateMessage {
    private String touser;
    private String template_id;
    private String url;
    private Map<String,RowMessage> data;
}
