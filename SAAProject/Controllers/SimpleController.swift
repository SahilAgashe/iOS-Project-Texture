//
//  SimpleController.swift
//  SAAProject
//
//  Created by SAHIL AMRUT AGASHE on 21/10/24.
//

import AsyncDisplayKit
import UIKit

class SimpleController: ASDKViewController<ASDisplayNode> {
    
    override init() {
        super.init(node: ASDisplayNode())
        node.backgroundColor = .white
        
        let imageNode = ASImageNode()
        imageNode.image = UIImage(named: "saaImage")
        imageNode.contentMode = .scaleAspectFit
        imageNode.style.preferredSize = CGSize(width: 200, height: 200)
        node.addSubnode(imageNode)
    
        let textNode1 = ASTextNode()
        textNode1.attributedText = NSAttributedString(string: "Hi Sahil, What's Up!")
        node.addSubnode(textNode1)
        
        let textNode2 = ASTextNode()
        textNode2.attributedText = NSAttributedString(string: "I am doing fine! What about you?")
        node.addSubnode(textNode2)
        
        let containerNode = ContainerNode()
        containerNode.backgroundColor = .red
        node.addSubnode(containerNode)
        
        // Set up layout with the Flexbox system
        //This is identical to the subclass override method -layoutSpecThatFits:
        node.layoutSpecBlock = { _, _ in
            let vStack = ASStackLayoutSpec.vertical()
            vStack.style.flexGrow = 1
            vStack.style.flexShrink = 1
            vStack.children = [textNode1, textNode2, containerNode]
            //let bkgLayoutSpec = ASBackgroundLayoutSpec(child: vStack, background: imageNode)
            let overlaylayoutSpec = ASOverlayLayoutSpec(child: imageNode, overlay: vStack)
            return ASCenterLayoutSpec(
                centeringOptions: .XY,
                sizingOptions: [],
                child: overlaylayoutSpec
            )
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ContainerNode: ASDisplayNode {
    
    let textNode1 = ASTextNode()
    let textNode2 = ASTextNode()
    
    override init() {
        super.init()
        
        textNode1.attributedText = NSAttributedString(string: "Text Node 1, Hi!")
        textNode2.attributedText = NSAttributedString(string: "Text Node 2, Hello")
        addSubnode(textNode1)
        addSubnode(textNode2)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let vStack = ASStackLayoutSpec.vertical()
        vStack.style.flexGrow = 1
        vStack.style.flexShrink = 1
        vStack.children = [textNode1, textNode2]
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10), child: vStack)
    }
}
