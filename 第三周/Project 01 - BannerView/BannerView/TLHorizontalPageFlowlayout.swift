//
//  TLHorizontalPageFlowlayout.swift
//  BannerView
//
//  Created by cqmlwlkj on 2017/10/31.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit

class TLHorizontalPageFlowlayout: UICollectionViewFlowLayout {

    var attributesArrayM = [UICollectionViewLayoutAttributes]()
    let rowCount = 2
    let rowItemCount = 4
    
    // 布局前的准备工作
    override func prepare() {
        super.prepare()
        
        // 从collectionView中获取到有多少个item
        let itemTotalCount = self.collectionView?.numberOfItems(inSection: 0)
        
        // 遍历出item的attributes，把它添加到管理它的属性数组中去
        for i in 0..<itemTotalCount! {
            let indexpath = IndexPath(item: i, section: 0)
            let attributes = self.layoutAttributesForItem(at: indexpath)
            attributesArrayM.append(attributes!)
        }
    }
    
    // 计算collectionView的滚动范围
    override var collectionViewContentSize: CGSize {
        
        // 计算item的宽度
        let itemWidth = ((self.collectionView?.frame.size.width)! - self.sectionInset.left - self.minimumInteritemSpacing * 3.0 - self.sectionInset.right) / CGFloat(rowItemCount)
        // 从collectionView中获取到有多少个item
        let itemTotalCount = self.collectionView?.numberOfItems(inSection: 0)
        
        // 理论上每页展示的item数目
        let pageItemCount = rowCount * rowItemCount
        // 余数（用于确定最后一页展示的item个数）
        let remainder = itemTotalCount! % pageItemCount
        // 除数（用于判断页数）
        var pageNumber = itemTotalCount! / pageItemCount
        // 总数小于 pageItemCount
        if itemTotalCount! <= pageItemCount {
            pageNumber = 1
        } else {
            if remainder == 0 {
                pageNumber = pageNumber + 0
            } else {
                // 余数不为 0，除数加 1
                pageNumber = pageNumber + 1
            }
        }
        
        var width = 0.0
        // 考虑特殊情况(当item的总个数不是rowCount * rowItemCount的整数倍,并且余数小于每行展示的个数的时候)
        if pageNumber > 1 && remainder != 0 && remainder < rowItemCount {
            let t = CGFloat(remainder) * itemWidth
            let b = CGFloat((pageNumber - 1) * rowItemCount) * (itemWidth + self.minimumInteritemSpacing)
            let c = CGFloat(remainder - 1) * self.minimumInteritemSpacing
            width = Double(self.sectionInset.left + t + b + c + self.sectionInset.right)
        } else {
            let cc = CGFloat(pageNumber * rowItemCount)
            width = Double(self.sectionInset.left + cc * (itemWidth + self.minimumInteritemSpacing) - self.minimumInteritemSpacing + self.sectionInset.right)
        }
        return CGSize(width: width, height: 0)
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        
        let item = indexPath.item
        
        // 当前 item 所在的页
        let pageNumber = item / (rowCount * rowItemCount)
        let x = item % rowItemCount + pageNumber * rowItemCount
        let y = item / rowItemCount - pageNumber * rowCount
        
        // item的宽高由行列间距和collectionView的内边距决定
        let itemWidth = ((self.collectionView?.frame.size.width)! - self.sectionInset.left - CGFloat(rowItemCount) * self.minimumInteritemSpacing) / CGFloat(rowItemCount)
        let itemHeight = ((self.collectionView?.frame.size.height)! - self.sectionInset.top - self.sectionInset.bottom - CGFloat(self.rowCount - 1) * self.minimumLineSpacing) / CGFloat(self.rowCount)
        
        // 计算出 item 的坐标
        let itemX = self.sectionInset.left + (itemWidth + self.minimumInteritemSpacing) * CGFloat(x)
        let itemY = self.sectionInset.top + (itemHeight + self.minimumLineSpacing) * CGFloat(y)
        
        let attributes = super.layoutAttributesForItem(at: indexPath)
        // 每个 item 的 frame
        attributes?.frame = CGRect(x: itemX, y: itemY, width: itemWidth, height: itemHeight)
        
        return attributes
    }
    
    // 返回 collectionView 视图中所有视图的属性数组
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributesArrayM
    }
    
}
