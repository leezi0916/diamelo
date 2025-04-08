package com.kh.diamelo.utils;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

public class Template {
    public static String saveFile(MultipartFile file, HttpSession session, String path) {
        // 파일 원본명
        String originName =  file.getOriginalFilename();

        // 확장자
        String ext = originName.substring(originName.lastIndexOf("."));

        // 년월시분초
        String currentTime = String.valueOf(System.currentTimeMillis());

        // 5자리 랜덤값
        int random = (int) (Math.random() * 10000);

        String changeName = "kh" + currentTime + random + ext;

        // 첨부파일을 저장할 폴더의 물리적 경로
        String savePath = session.getServletContext().getRealPath(path);
//        System.out.println(savePath);

        try {
            //파일 저장
            file.transferTo(new File(savePath + changeName));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return changeName;
    }

    public static String saveProductlFile(MultipartFile file, HttpSession session, String path) {
        // 파일 원본명
        String originName =  file.getOriginalFilename();

        // 확장자
        String ext = originName.substring(originName.lastIndexOf("."));

        // 년월시분초
        String currentTime = String.valueOf(System.currentTimeMillis());

        // 5자리 랜덤값
        int random = (int) (Math.random() * 10000);

        String changeName = "PRO" + currentTime + random + ext;

        // 첨부파일을 저장할 폴더의 물리적 경로
        String savePath = session.getServletContext().getRealPath(path);
//        System.out.println(savePath);

        try {
            //파일 저장
            file.transferTo(new File(savePath + changeName));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return changeName;
    }
}
