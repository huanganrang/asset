package jb.util;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by guxin on 2016/3/24.
 */
public class TwoDimensionCodeUtil {

    /**
     * 二维码长度width，宽度height，内容content，生成的图片存放路径path，生成的图片名称fileName，生成的图片类型format
     */
    public String createCode(int width, int height, String content, String path, String fileName, String format) {

        String resultFile = "";
        try {
            Map hints = new HashMap();
            hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
            BitMatrix bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, width, height, hints);
            File codeFile = new File(path, fileName + "." + format);
            MatrixToImageWriter.writeToFile(bitMatrix, format, codeFile);
            resultFile =  path + File.separator + fileName + "." + format;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultFile;
    }

}
