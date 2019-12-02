//
//  UIImageViewExtension.swift
//  Starlordtech
//
//  Created by Johnny Chang on 2019/11/29.
//  Copyright © 2019 starlordtech. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    func setImageWithFadeEffectWithURL(_ url:String,placeHolder:UIImage) {
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_setImage(with: URL(string: url), placeholderImage: placeHolder, options:SDWebImageOptions(rawValue: 0), completed: { [weak self] (image, error,imageCacheType, url) in
            if ((error) != nil && url != nil) {
                print(">>>>>>>>>> ERROR(\(url!.absoluteString)) <<<<<<<<<<: \(error!.localizedDescription)")
            }
            if let _ = image{
                 DispatchQueue.main.async {
                    self?.image = image
                }
            }
        })
    }
}
