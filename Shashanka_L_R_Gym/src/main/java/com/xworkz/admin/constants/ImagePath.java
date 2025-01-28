package com.xworkz.admin.constants;


import lombok.Getter;

@Getter
public enum ImagePath {
    IMAGE_PATH("D:\\Commons-User-File-Upload\\");

    private String path;

    ImagePath(String path) {
        this.path = path;
    }
}