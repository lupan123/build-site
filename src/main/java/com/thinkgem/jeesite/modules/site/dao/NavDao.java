package com.thinkgem.jeesite.modules.site.dao;

import com.thinkgem.jeesite.common.persistence.TreeDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.site.entity.Nav;

import java.util.List;

/**
 * TODO 网站栏目dao
 *
 * @author lupan
 * @version 2016/1/4 0004
 */
@MyBatisDao
public interface NavDao extends TreeDao<Nav> {

    List<Nav> findByParentId(Nav entity);

    Nav getByValue(Nav entity);
}
