//
//  ViewController.swift
//  Task11_Part2App
//
//  Created by 山崎喜代志 on 2021/04/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var selectedPrefectureLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedPrefectureLabel.text = "未選択"
    }

    @IBAction func exit(segue: UIStoryboardSegue) {
        print("遷移したよ")
    }

    @IBAction private func didTapChangeButton(_ sender: Any) {
        performSegue(withIdentifier: "Next", sender: sender)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifer = segue.identifier else {return}

            switch identifer {
            case "Next":
                guard let navigationController = segue.destination as? UINavigationController,
                      let secondViewController = navigationController.topViewController as? SecondViewController else {
                    return
                }
                secondViewController.delegate = self
                return
            default:
                break
            }
        }
}

extension ViewController: SecondViewControllerDelegate {
    func selectedPrefecture(name: String) {
        selectedPrefectureLabel.text = name
        print("県名", name)
    }

}
