package cn.attackme.escort.Model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * Created by arthurme on 2017/3/20.
 */
@Entity
@Table

@AllArgsConstructor
@NoArgsConstructor
public class User implements Serializable{

    private static final long serialVersionUID = 895922977663522702L;

    //用户名
    @Id
    @Getter
    @Setter
    private String userName;

    //真实姓名
    @Getter
    @Setter
    private String name;

    //性别
    @Getter
    @Setter
    private boolean sex;

    //微信昵称
    @Getter
    @Setter
    private String nickName;

    //微信号
    @Getter
    @Setter
    private String openid;

    @Setter
    private String passWord;

    //个人信息中的手机号
    @Getter
    @Setter
    private String phoneNumber;

    //是否禁用
    @Getter
    @Setter
    private boolean isDeleted;

    //是否认证
    @Getter
    @Setter
    private boolean isAuthed;

    @Getter
    @Setter
    @Enumerated(EnumType.STRING)
    private Role role;

    //信誉积分
    @Getter
    @Setter
    private Integer integration;

    //所属学校
    @Getter
    @Setter
    @OneToOne
    @JoinColumn(name = "school")
    private School school;

    //学工号
    @Getter
    @Setter
    private String studentId;

    //头像url
    @Getter
    @Setter
    private String headImageUrl;

    //学生证照片url
    @Setter
    private String stuCardUrl;

    @Setter
    @OneToMany(mappedBy = "user",cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.EXTRA)
    private List<Address> addressList;

    @Setter
    @OneToMany(mappedBy = "delegation",cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.EXTRA)
    private List<Package> publishList;

    @Setter
    @OneToMany(mappedBy = "agency",cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.EXTRA)
    private List<Package> receiveList;

    public User(String userName, String passWord) {
        this.userName = userName;
        this.passWord = passWord;
    }

    @JsonIgnore    //生成json不包含此字段,必须打在Getter上面
    public String getPassWord() {
        return passWord;
    }

    @JsonIgnore
    public List<Address> getAddressList(){
        return addressList;
    }

    @JsonIgnore
    public List<Package> getPublishList(){
        return publishList;
    }

    @JsonIgnore
    public List<Package> getReceiveList(){
        return receiveList;
    }

    @JsonIgnore
    public String getStuCardUrl(){
        return stuCardUrl;
    }
}
