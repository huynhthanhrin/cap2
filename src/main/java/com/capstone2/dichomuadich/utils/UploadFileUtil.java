

package com.capstone2.dichomuadich.utils;

import org.springframework.beans.factory.annotation.Value;

import java.awt.image.BufferedImage;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;


/**
 * TODO: Class description
 */
public class UploadFileUtil {
    @Value("${file.upload-dir}")
    private String uploadDir;

    /**
     * TODO: Method description
     *
     * @param fileName
     * @return
     */
    public static String rename(String fileName) {
        String nameFile = "";
        if (!fileName.isEmpty()) {
            String[] arrImg = fileName.split("\\.");
            String duoiFileImg = arrImg[arrImg.length - 1];

            for (int i = 0; i < (arrImg.length - 1); i++) {
                if (i == 0) {
                    nameFile = arrImg[i];
                } else {
                    nameFile += "-" + arrImg[i];
                }
            }
            nameFile = nameFile + "-" + System.nanoTime() + "." + duoiFileImg;
        }
        return nameFile;
    }

    /**
     * TODO: Method description
     *
     * @param nameInput
     * @param imageBase64
     * @return
     */
    public static String uploadImage(String nameInput, String imageBase64) {
        try {
            BufferedImage image = null;
            byte[] imageByte;
            byte[] decodedImg = Base64.getDecoder().decode(imageBase64.getBytes(StandardCharsets.UTF_8));
            String newFileName = rename(nameInput);
            Path destinationFile = Paths.get("D:/BTGIMG/", newFileName);
            Files.write(destinationFile, decodedImg);

            return newFileName;
        } catch (Exception e) {
            return "";
        }
    }

    /**
     * TODO: Method description
     *
     * @param name
     * @return
     */
    public static boolean deleteImage(String name) {
        File image = new File("D:/BTGIMG/" + name);
        if (image.delete()) {
            return true;
        }
        return false;
    }
}

