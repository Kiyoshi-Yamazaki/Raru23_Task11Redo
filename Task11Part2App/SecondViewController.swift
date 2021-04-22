//
//  SecondViewController.swift
//  Task11_Part2App
//
//  Created by 山崎喜代志 on 2021/04/20.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func selectedPrefecture(prefecture: Prefecture)
}

class SecondViewController: UIViewController {

    @IBOutlet weak private var tableView: UITableView!
    private let prefectures = Prefecture.prefectures
    weak var delegate: SecondViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        prefectures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = prefectures[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedPrefecture(prefecture: prefectures[indexPath.row])
        performSegue(withIdentifier: "back", sender: nil)
    }
}
