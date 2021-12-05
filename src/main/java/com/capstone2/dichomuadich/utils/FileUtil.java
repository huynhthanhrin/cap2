
package com.capstone2.dichomuadich.utils;

import com.capstone2.dichomuadich.constant.CommonConstants;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;


/**
 * TODO: Class description
 */
public class FileUtil {
    /**
     * TODO: Method description
     *
     * @param multipartFile
     * @param request
     * @return
     * @throws IOException
     * @throws IllegalStateException
     */
    public static String upload(MultipartFile multipartFile, HttpServletRequest request) throws IllegalStateException, IOException {
        String webPath = request.getServletContext().getRealPath("");
        String dirPath = webPath + CommonConstants.DIR_UPLOAD;
        if (new File(dirPath).exists()) {
            new File(dirPath).mkdir();
        }

        String fileName = String.valueOf(System.currentTimeMillis()) + ".jpg";

        String pathFile = dirPath + File.separator + fileName;
        multipartFile.transferTo(new File(pathFile));
        return fileName;
    }

    /**
     * TODO: Method description
     *
     * @param nameFile
     * @param request
     * @throws IOException
     * @throws IllegalStateException
     */
    public static void delete(String nameFile, HttpServletRequest request) throws IllegalStateException, IOException {
        String dirFile = request.getServletContext().getRealPath("") + CommonConstants.DIR_UPLOAD;
        File file = new File(dirFile + File.separator + nameFile);
        if (file.exists()) {
            file.delete();
        }
    }
}

