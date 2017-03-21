package cn.attackme.escort.Model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by arthurme on 2017/3/20.
 */
@Entity
@Table

@AllArgsConstructor
@NoArgsConstructor
public class User implements Serializable{

    private static final long serialVersionUID = 895922977663522702L;

    @Id
    @Getter
    @Setter
    private String userName;

    @Getter
    @Setter
    private String name;

    @Getter
    @Setter
    private String openid;

    @Setter
    private String passWord;

    @Getter
    @Setter
    private boolean isDeleted;

    @Getter
    @Setter
    @Enumerated(EnumType.STRING)
    private Role role;

    public User(String userName, String passWord) {
        this.userName = userName;
        this.passWord = passWord;
    }

    @JsonIgnore    //生成json不包含此字段,必须打在Getter上面
    public String getPassWord() {
        return passWord;
    }
}
