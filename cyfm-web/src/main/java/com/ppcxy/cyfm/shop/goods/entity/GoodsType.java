package com.ppcxy.cyfm.shop.goods.entity;

import com.ppcxy.common.entity.IdEntity;
import com.ppcxy.common.extend.entity.Treeable;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.annotations.Formula;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 商品类型
 */
@Entity
@Table(name = "gs_type")
public class GoodsType extends IdEntity implements Treeable<Long> {
    /**
     * 标题
     */
    private String name;
    /**
     * 直接父级
     */
    private Long parentId;
    /**
     * 父路径
     */
    private String parentIds;
    /**
     * 权重
     */
    private Integer weight;
    /**
     * 图标
     */
    private String icon;
    /**
     * 是否有叶子节点
     */
    private boolean hasChildren;
    /**
     * 是否显示
     */
    private Boolean show = Boolean.TRUE;
    
    @Override
    public String getName() {
        return name;
    }
    
    @Override
    public void setName(String name) {
        this.name = name;
    }
    
    @Override
    public Long getParentId() {
        return parentId;
    }
    
    @Override
    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }
    
    @Override
    public String getParentIds() {
        return parentIds;
    }
    
    @Override
    public void setParentIds(String parentIds) {
        this.parentIds = parentIds;
    }
    
    
    @Override
    @Transient
    public String getSeparator() {
        return "/";
    }
    
    @Override
    public String makeSelfAsNewParentIds() {
        return getParentIds() + getId() + getSeparator();
    }
    
    public Integer getWeight() {
        return weight;
    }
    
    public void setWeight(Integer weight) {
        this.weight = weight;
    }
    
    public String getIcon() {
        if (!StringUtils.isEmpty(icon)) {
            return icon;
        }
        if (isRoot()) {
            return getRootDefaultIcon();
        }
        if (isLeaf()) {
            return getLeafDefaultIcon();
        }
        return getBranchDefaultIcon();
    }
    
    public void setIcon(String icon) {
        this.icon = icon;
    }
    
    @Formula(value = "(select count(*) from cy_sys_resource f_t where f_t.parent_id = id)")
    public boolean isHasChildren() {
        return hasChildren;
    }
    
    public void setHasChildren(boolean hasChildren) {
        this.hasChildren = hasChildren;
    }
    
    @Column(name = "is_show")
    public Boolean getShow() {
        return show;
    }
    
    public void setShow(Boolean show) {
        this.show = show;
    }
    
    /**
     * 根节点默认图标 如果没有默认 空即可
     *
     * @return
     */
    @Transient
    public String getRootDefaultIcon() {
        return "ztree_setting";
    }
    
    /**
     * 树枝节点默认图标 如果没有默认 空即可
     *
     * @return
     */
    @Transient
    public String getBranchDefaultIcon() {
        return "ztree_folder";
    }
    
    /**
     * 树叶节点默认图标 如果没有默认 空即可
     *
     * @return
     */
    @Transient
    public String getLeafDefaultIcon() {
        return "fa fa-folder-open";
    }
    
    @Transient
    public boolean isRoot() {
        if (getParentId() != null && getParentId() == 0) {
            return true;
        }
        return false;
    }
    
    @Transient
    public boolean isLeaf() {
        if (isRoot()) {
            return false;
        }
        if (isHasChildren()) {
            return false;
        }
        
        return true;
    }
}
