//
//  BaseView.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 30.1.24..
//

import Foundation
import UIKit

class BaseView: UIView {
    public var view: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup(nibName: String(describing: type(of: self)))
    }

    init(frame: CGRect, nibName: String) {
        super.init(frame: frame)
        xibSetup(nibName: nibName)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup(nibName: String(describing: type(of: self)))
    }
    
    init?(coder aDecoder: NSCoder, nibName: String) {
        super.init(coder: aDecoder)
        xibSetup(nibName: nibName)
    }
}

extension BaseView {
    func xibSetup(nibName: String) {
        guard let loadedView = loadViewFromNib(nibName: nibName) else { return }
        view = loadedView
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
    }
    
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of:self))
        guard bundle.path(forResource: nibName, ofType: "nib") != nil else { return nil }
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}

