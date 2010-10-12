/*
 * File   : $Source: /alkacon/cvs/opencms/src-modules/org/opencms/ade/galleries/client/ui/Attic/CmsResultItemWidget.java,v $
 * Date   : $Date: 2010/09/14 14:20:24 $
 * Version: $Revision: 1.2 $
 *
 * This library is part of OpenCms -
 * the Open Source Content Management System
 *
 * Copyright (C) 2002 - 2009 Alkacon Software (http://www.alkacon.com)
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * For further information about Alkacon Software, please see the
 * company website: http://www.alkacon.com
 *
 * For further information about OpenCms, please see the
 * project website: http://www.opencms.org
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

package org.opencms.ade.galleries.client.ui;

import org.opencms.ade.galleries.client.ui.css.I_CmsLayoutBundle;
import org.opencms.gwt.client.CmsCoreProvider;
import org.opencms.gwt.client.ui.CmsListItemWidget;
import org.opencms.gwt.shared.CmsIconUtil;
import org.opencms.gwt.shared.CmsListInfoBean;

import com.google.gwt.user.client.ui.HTML;

/**
 * The result list item widget.<p>
 * 
 * Enabling the image tile view.<p>
 * 
 * @author Tobias Herrmann
 * 
 * @version $Revision: 1.2 $
 * 
 * @since 8.0.0
 */
public class CmsResultItemWidget extends CmsListItemWidget {

    /** The image resource type name. */
    private static final String IMAGE_TYPE = "image";

    /** Standard image tile scale parameter. */
    private static final String IMAGE_SCALE_PARAM = "?__scale=w:142,h:100,t:1,c:transparent,r:2";

    /** Tile view flag. */
    private boolean m_hasTileView;

    /**
     * Constructor.<p>
     * 
     * @param infoBean the resource info bean
     * @param resourceType the resource type
     * @param resourcePath the resource path
     */
    public CmsResultItemWidget(CmsListInfoBean infoBean, String resourceType, String resourcePath) {

        super(infoBean);
        setIcon(CmsIconUtil.getResourceIconClasses(resourceType, resourcePath, false));

        // if resourceType=="image" prepare for tile view
        if (IMAGE_TYPE.equals(resourceType)) {
            m_hasTileView = true;
            // add tile view marker css classes

            // insert tile view image div
            HTML imageTile = new HTML("<img src="
                + CmsCoreProvider.get().link(resourcePath)
                + IMAGE_SCALE_PARAM
                + " title="
                + infoBean.getTitle()
                + " />");
            imageTile.setStyleName(I_CmsLayoutBundle.INSTANCE.galleryResultItemCss().imageTile());
            m_contentPanel.insert(imageTile, 0);
        }

    }

    /**
     * Indicates wther there is a tile view available for this widget.<p>
     * 
     * @return <code>true</code> if a tiled view is available
     */
    public boolean hasTileView() {

        return m_hasTileView;
    }

}