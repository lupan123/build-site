package com.thinkgem.jeesite.modules.site.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.site.entity.Content;


/**
 * TODO 网站内容管理Dao
 *
 * @author lupan
 * @version 2015/12/21 0021
 */
@MyBatisDao
public interface ContentDao extends CrudDao<Content> {

    void updateDelFlag(Content content);
}
