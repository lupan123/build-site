package com.thinkgem.jeesite.modules.site.entity;


import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.Dict;

/**
 * TODO 网站栏目动态内容pojo
 *
 * @author lupan
 * @version 2015/12/21 0021
 */


public class Content extends DataEntity<Content> {

    //子模块
    private Nav nav;
    //一级标题
    private String h1;
    //二级标题
    private String h2;
    //三级标题
    private String h3;
    //简介
    private String intro;
    //内容
    private String content;
    //文件
    private String file;
    //图片
    private String image;
    //链接
    private String href;
    //字典对象，用于有分类的类容存储分类
    private Dict dict;


    public Nav getNav() {
        return nav;
    }

    public void setNav(Nav nav) {
        this.nav = nav;
    }

    public String getH1() {
        return h1;
    }

    public void setH1(String h1) {
        this.h1 = h1;
    }

    public String getH2() {
        return h2;
    }

    public void setH2(String h2) {
        this.h2 = h2;
    }

    public String getH3() {
        return h3;
    }

    public void setH3(String h3) {
        this.h3 = h3;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public Dict getDict() {
        return dict;
    }

    public void setDict(Dict dict) {
        this.dict = dict;
    }
}
