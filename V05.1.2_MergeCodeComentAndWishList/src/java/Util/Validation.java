/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author tuong
 */
public class Validation {

    public Validation() {
    }

    public static boolean checkStringArray(String[] str) {
        for (int i = 0; i < str.length; i++) {
            str[i] = str[i].trim();
            if (str[i] == null || str[i].isBlank()) {
                return false;
            }
        }
        return true;
    }

    public static boolean checkString(String str) {
        str = str.trim();
        if (str == null || str.isBlank()) {
            return false;
        }
        return true;
    }
    
    public static String createFileNameRandom(Part file_image) {
        String image_file_name = file_image.getSubmittedFileName();
        String[] image_file_name_split = image_file_name.split("\\.");

        image_file_name_split[0] = image_file_name_split[0] + (int) (Math.random() * 10000);
        image_file_name = image_file_name_split[0] + "." + image_file_name_split[1];

        return image_file_name;
    }
    public static String insertImageIntoServer(HttpServletRequest request, String image_file_name, Part file_image_course) {
        String upload_directory = "/image_course"; // folder goc cua web khi builded
        //tra ve folder khi not_build
        String upload_path_to_project = ServerPath.getPathImageCouse()+ File.separator + image_file_name;
        String upload_path_to_server = request.getServletContext().getRealPath(upload_directory).replaceFirst("build", "") + File.separator + image_file_name;

        String replacedPath = upload_path_to_project.replace("\\", "/");
        String replacePath_not_build = replacedPath.replaceFirst("//", "/");

//        String replacedPath_server = upload_path_to_server.replace("\\", "/");
        String replacePath_server_not_build = upload_path_to_server.replaceFirst("//", "/");
        try {
            FileOutputStream fos = new FileOutputStream(replacePath_not_build);
            InputStream is = file_image_course.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            FileOutputStream fos = new FileOutputStream(replacePath_server_not_build);
            InputStream is = file_image_course.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return replacePath_not_build;
    }

    public static boolean verifyEmail(String email) {
        email = email.trim();
        if (email == null || email.equals("")) {
            return false;
        }
        if (!email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$")) {
            return false;
        }
        return true;
    }

    private boolean verifyName(String name) {
        name = name.trim();
        if (name == null || name.equals("")) {
            return false;
        }
        if (!name.matches("[a-zA-Z]*")) {
            return false;
        }
        return true;
    }
}
