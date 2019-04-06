//
//  ProfileViewController.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/04/07.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import PhotoSlider

class ProfileViewController: UIViewController {
    
    @IBOutlet private weak var iconImageView: IconImageView! {
        didSet {
            iconImageView.tap.asDriver().drive(onNext: { [weak self] in
                let url = URL(string: "https://pbs.twimg.com/profile_images/1061520538386915329/ExNUPGbF_400x400.jpg")!
                let photoSlider = PhotoSlider.ViewController(imageURLs: [url])
                photoSlider.modalPresentationStyle = .overCurrentContext
                photoSlider.captionBackgroundViewColor = .clear
                photoSlider.backgroundViewColor = .clear
                photoSlider.visiblePageControl = false
                self?.present(photoSlider, animated: true)
            }).disposed(by: rx.disposeBag)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "プロフィール"
        iconImageView.setImage(with: "https://pbs.twimg.com/profile_images/1061520538386915329/ExNUPGbF_400x400.jpg")
    }

}
