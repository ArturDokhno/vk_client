//
//  NewsViewModelFactory.swift
//  homeWork_1
//
//  Created by Артур Дохно on 26.12.2021.
//  Copyright © 2021 Марат Нургалиев. All rights reserved.
//

import UIKit
import SDWebImage

final class NewsViewModelFactory {
    
    func constructViewModels(from feed: [VkFeed]) -> [NewsViewModel] {
        return feed.compactMap(self.viewModel)
    }
    
    private func viewModel(from feed: VkFeed) -> NewsViewModel {
        let labelDate = feed.getFeedDate()
        let labelFeedGroupHeader = feed.sourceName
        
        
        
        let labelText = feed.feedText
        let labelLike = feed.getStringFrom(count: feed.countLikes)
        let labelViews = feed.getStringFrom(count: feed.countViews)
        let labelShare = feed.getStringFrom(count: feed.countReposts)
        let labelComment = feed.getStringFrom(count: feed.countComments)
        
        let imageViewGroup = UIImageView.init()
        imageViewGroup.sd_setImage(with: URL(string: feed.sourceUrl), placeholderImage: UIImage(named: "noPhoto"))
        
        let imageNew = UIImageView.init()
        
        if feed.attachments.count > 0 {
            
            let height = UIScreen.main.bounds.size.width * CGFloat(feed.attachments[0].height) / CGFloat(feed.attachments[0].width)
            
            imageNew.pin.height(height)
            
            imageNew.sd_setImage(with: URL(string: feed.attachments[0].imageUrl), placeholderImage: UIImage(named: "noPhoto"))
            
        } else {
            imageNew.pin.height(0)
        }
        
        return NewsViewModel(labelDate: labelDate, labelFeedGroupHeader: labelFeedGroupHeader, labelText: labelText, labelLike: labelLike, labelViews: labelViews, labelShare: labelShare, labelComment: labelComment, imageViewGroup: imageViewGroup, imageNew: imageNew)
    }
    
}
