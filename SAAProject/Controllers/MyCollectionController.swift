//
//  MyCollectionController.swift
//  SAAProject
//
//  Created by SAHIL AMRUT AGASHE on 24/11/24.
//

import UIKit
import AsyncDisplayKit

class MyCollectionController: UIViewController {
    
    private lazy var myImageNode: ASImageNode = {
        let imageNode = ASImageNode()
        imageNode.image = UIImage(named: "saaImage")
        imageNode.backgroundColor = .yellow
        imageNode.contentMode = .scaleAspectFit
        return imageNode
    }()
    
    private lazy var collectionNode: ASCollectionNode = {
        let cn = ASCollectionNode(collectionViewLayout: UICollectionViewFlowLayout())
        cn.view.contentInsetAdjustmentBehavior = .never
        cn.view.showsVerticalScrollIndicator = false
        cn.leadingScreensForBatching = 1.0
        //cn.dataSource = self
        //cn.delegate = self
        return cn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        //addCollectionNode()
        addImageNodeToCenter()
    }
    
    private func addCollectionNode() {
        view.addSubnode(collectionNode)
    }
    
    private func addImageNodeToCenter() {
        view.addSubnode(myImageNode)
        myImageNode.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myImageNode.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myImageNode.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myImageNode.view.widthAnchor.constraint(equalToConstant: 300),
            myImageNode.view.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    
}

extension MyCollectionController: ASCollectionDataSource {
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let cellNodeBlock: () -> ASCellNode = {
            return ASCellNode()
        }
        return cellNodeBlock
    }
}

extension MyCollectionController: ASCollectionDelegate {
    
}

class MyCellNode: ASCellNode {
    
    override init() {
        super.init()
    }
    
}
