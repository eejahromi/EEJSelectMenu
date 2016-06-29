//
//  ViewController.swift
//  EEJSelectMenuSwift
//


import UIKit

class ViewController: UIViewController, EEJSelectMenuDelegate {
    @IBOutlet weak var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func menuButtonPressed(sender: AnyObject) {
        let menu = EEJSelectMenu(buttons: ["ONE","TWO","THREE","FOUR","FIVE"],
                                 animationStyle: AnimationStyle.EEJAnimationStyleScale,
                                 color: UIColor.blackColor(),
                                 andDelegate: self);
        menu.selectedButtonColor = UIColor.grayColor()
        presentViewController(menu, animated: false, completion: nil)
    }

    func EEJSelectMenuButtonWasPressedWithTitle(title: String!) {
        titleLabel.text = title;
    }
}

