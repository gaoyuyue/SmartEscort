package cn.attackme.Wechat.Util;

import javax.validation.constraints.NotNull;
import java.util.Arrays;

import static cn.attackme.escort.Utils.SHAUtils.getSHA_1;

/**
 * Created by arthurme on 2017/3/3.
 */
public class SecurityUtil {
    private static final String token = "SmartEscort";

    /**
     *
     * @param signature
     * @param timestamp
     * @param nonce
     * @return
     */
    public static boolean isSignature(@NotNull String signature,
                                      @NotNull String timestamp,
                                      @NotNull String nonce){
        String[] attr = new String[]{token,timestamp,nonce};
        Arrays.sort(attr);
        StringBuffer stringBuffer = new StringBuffer();
        for(String s : attr){
            stringBuffer.append(s);
        }
        String sha_1 = getSHA_1(stringBuffer.toString());
        return signature.equals(sha_1);
    }
}
