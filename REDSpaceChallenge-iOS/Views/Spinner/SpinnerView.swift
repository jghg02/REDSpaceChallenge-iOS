//
//  SpinnerView.swift
//  REDSpaceTest
//
//  Created by Josue German Hernandez Gonzalez on 07-12-21.
//

import UIKit

class SpinnerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        let view = SpinnerView.fromNib()
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    
}
