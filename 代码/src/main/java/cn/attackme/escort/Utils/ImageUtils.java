package cn.attackme.escort.Utils;


import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.UUID;

import static org.apache.commons.codec.binary.Base64.decodeBase64;
import static org.apache.commons.codec.binary.Base64.encodeBase64String;

/**
 * Created by arthurme on 2017/7/2.
 */
public class ImageUtils {
    public static String decodeBase64ToImage(String base64,String path) throws IOException {
        byte[] bytes = decodeBase64(base64);
        // 调整异常数据
        for (int i = 0; i < bytes.length; ++i) {
            if (bytes[i] < 0) {
                bytes[i] += 256;
            }
        }
        String imageName = getImageName(base64);
        Files.write(Paths.get(path+imageName), bytes, StandardOpenOption.CREATE);
        return imageName;
    }

    public static String encodeImageToBase64(String path,String name,String formate) throws IOException {
        BufferedImage bufferedImage = ImageIO.read(new File(path+name));
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ImageIO.write(bufferedImage,formate,outputStream);
        return encodeBase64String(outputStream.toByteArray());
    }

    private static String getImageName(String base64){
        return UUID.randomUUID().toString()+"."+base64.split(";")[0].split(":")[1].split("/")[1];
    }
}
