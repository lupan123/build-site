package com.thinkgem.jeesite.modules.site.entity;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.TreeEntity;

/**
 * TODO 网站页面栏目
 *
 * @author lupan
 * @version 2015/12/24 0024
 */
public class Nav extends TreeEntity<Nav> {

    private static final long serialVersionUID = -2320615862481297402L;

    private String includeContentColumns ;    //包含网站内容的字段，用,分开

    private String value;    //栏目的值，用于jsp页面获取model中的attribute

    private String dictType;    //字典type，用于获取有分类的内容的分类

    private String isAudit;	// 是否需要审核

    public Nav(){
        super();
        this.sort = 30;
        this.delFlag = DEL_FLAG_NORMAL;
        this.isAudit = Global.NO;
    }

    public Nav(String id){
        this();
        this.id = id;
    }
    /**
     * 判断是否为根结点
     * @param id
     * @return
     */
    public static boolean isRoot(String id){
        return id != null && id.equals("1");
    }

    @Override
    public Nav getParent() {
        return parent;
    }

    @Override
    public void setParent(Nav parent) {
        this.parent = parent;
    }

    public String getIncludeContentColumns() {
        return includeContentColumns;
    }

    public void setIncludeContentColumns(String includeContentColumns) {
        this.includeContentColumns = includeContentColumns;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getDictType() {
        return dictType;
    }

    public void setDictType(String dictType) {
        this.dictType = dictType;
    }

    public String getIsAudit() {
        return isAudit;
    }

    public void setIsAudit(String isAudit) {
        this.isAudit = isAudit;
    }
}
