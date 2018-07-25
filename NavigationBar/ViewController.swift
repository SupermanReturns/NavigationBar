//
//  ViewController.swift
//  NavigationBar
//
//  Created by Superman on 2018/7/25.
//  Copyright © 2018年 Superman. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {

    fileprivate var _colorCollectionView : UICollectionView?
    fileprivate var colors : [UIColor] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "CustomNavigationBarDemo"
        self.view.backgroundColor = UIColor.white
        self.constructColorsView()
    }
    
    func constructColorsView() {
        if(colors.count == 0){
            colors.append(UIColor.blue)
            colors.append(UIColor.red)
            colors.append(UIColor.purple)
            colors.append(UIColor.yellow)
            colors.append(UIColor.green)
            colors.append(UIColor.darkGray)
            colors.append(UIColor.cyan)
            colors.append(UIColor.magenta)
        }
        
        let colorLayout = UICollectionViewFlowLayout.init()
        colorLayout.minimumLineSpacing = 1.0
        colorLayout.minimumInteritemSpacing = 20.0
        colorLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        colorLayout.itemSize = CGSize(width: ColorCell.CellWidth, height: ColorCell.CellHeight)
        colorLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        
        _colorCollectionView = UICollectionView.init(frame: CGRect.zero,collectionViewLayout:colorLayout)
        _colorCollectionView?.delegate = self
        _colorCollectionView?.dataSource = self
        _colorCollectionView?.register(ColorCell.self, forCellWithReuseIdentifier: ColorCell.ColorCellId)
        _colorCollectionView?.isScrollEnabled = false
        _colorCollectionView?.backgroundColor = UIColor.white
        _colorCollectionView?.frame = CGRect(x: 0, y: 40, width: self.view.frame.size.width, height: ColorCell.CellHeight * 3)
        self.view.addSubview(_colorCollectionView!)
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count / 2
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:ColorCell.ColorCellId , for: indexPath) as! ColorCell
        
        cell.colorView.backgroundColor = colors[indexPath.section*4+indexPath.row]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let color = colors[indexPath.section*4 + indexPath.row]
        let color = colors[indexPath.row]

        self.navigationController?.navigationBar.setCustomBackgroundColor(color)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


class ColorCell: UICollectionViewCell {
    static let ColorCellId = "ColorCell"
    static let colorMargin : CGFloat = 5
    static let CellWidth : CGFloat = 60
    static let CellHeight : CGFloat = 60
    fileprivate var _colorView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        self.colorView.tag = 0
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var colorView : UIView{
        if (_colorView == nil) {
            _colorView = UIView.init()
            _colorView?.layer.cornerRadius = 6.0
            _colorView?.clipsToBounds = true
            _colorView?.frame = CGRect(x: ColorCell.colorMargin, y: ColorCell.colorMargin, width: ColorCell.CellWidth-ColorCell.colorMargin*2, height: ColorCell.CellHeight - ColorCell.colorMargin*2)
            self.contentView.addSubview(_colorView!)
        }
        return _colorView!
    }
    
    
}






























