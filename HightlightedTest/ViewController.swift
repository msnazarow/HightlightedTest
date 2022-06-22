//
//  ViewController.swift
//  HightlightedTest
//
//  Created by Назаров Михаил Сергеевич on 22.06.2022.
//

import UIKit
import SnapKit

class TestCell: UITableViewCell {
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            if highlighted {
                self.backgroundColor = .blue
            } else {
                self.backgroundColor = .clear
            }
        })
    }

    func configure(with text: String) {
        textLabel?.text = text
    }
}

class ViewController: UIViewController {
    var data = [
        "Ячейка",
        "Ячейка",
        "Ячейка",
        "Ячейка",
        "Ячейка",
        "Ячейка",
        "Ячейка",
        "Ячейка",
        "Ячейка",
        "Ячейка"
    ]

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TestCell.self, forCellReuseIdentifier: "\(TestCell.self)")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(TestCell.self)", for: indexPath) as! TestCell
        cell.configure(with: data[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if data[indexPath.row] != "Перезагрузка" {
            data[indexPath.row] = "Перезагрузка"
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}
