package cn.attackme.Wechat.Menu;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created by arthurme on 2017/3/4.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClickButton {
    private String type;
    private String name;
    private String key;
}
