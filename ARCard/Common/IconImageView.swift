//
//  IconImageView.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/04/07.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

@IBDesignable
class IconImageView: UIView {
    
    private let imageView = UIImageView()
    private let tapGestureRecognizer = UITapGestureRecognizer()
    private let tapSubject = PublishSubject<Void>()
    var tap: Driver<Void> {
        return tapSubject.asDriver(onErrorJustReturn: ())
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layoutContents()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutContents()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let cornerRadius = bounds.size.width / 2.0
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        imageView.layer.cornerRadius = cornerRadius
        imageView.layer.masksToBounds = true
    }
    
    private func layoutContents() {
        setUpGestureRecognizers()

        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.lightGray
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    private func setUpGestureRecognizers() {
        tapGestureRecognizer.cancelsTouchesInView = true
        tapGestureRecognizer.accessibilityLabel = "IconImageViewTap"
        tapGestureRecognizer.rx.event.asDriver().drive(onNext: { [weak self] _ in
            self?.tapSubject.onNext(())
        }).disposed(by: rx.disposeBag)
    }
    
    func setImage(with imageString: String) {
        imageView.setImage(with: imageString)
    }
}
