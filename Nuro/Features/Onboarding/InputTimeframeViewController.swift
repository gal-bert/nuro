//
//  InputTimeframeViewController.swift
//  Nuro
//
//  Created by Gregorius Albert on 14/11/22.
//

import UIKit

class InputTimeframeViewController: UIViewController {

    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        return view
    }()

    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Tentukan waktu mulai rutinitas"
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 64)
        view.textColor = Colors.Neutral.white
        view.textAlignment = .center
        return view
    }()

    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
        view.allowsSelection = false
        view.isScrollEnabled = false
        view.backgroundColor = .clear
        return view
    }()

    lazy var noticeLabel: UILabel = {
        let view = UILabel()
        view.text = "(Jam dapat diubah di halaman Pengaturan)"
        view.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 24)
        view.textColor = Colors.Neutral.white
        view.textAlignment = .center
        return view
    }()

    lazy var pageControl = OnboardingPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.Brand.blueViolet

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingTimeTableViewCell.self, forCellReuseIdentifier: SettingTimeTableViewCell.identifier)

        view.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(tableView)
        stackView.addArrangedSubview(noticeLabel)

        view.addSubview(pageControl)

        pageControl.pageIndicator.text = "4/\(Strings.maxOnboardingPage)"

        pageControl.skipButton.alpha = 0
        let font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 32)
        pageControl.nextButton.setAttributedTitle(NSAttributedString(string: "Selesai", attributes: [NSAttributedString.Key.font: font as Any, NSAttributedString.Key.foregroundColor: Colors.Brand.blueViolet]), for: .normal)
        
        pageControl.nextButton.addTarget(self, action: #selector(nextAction), for: .touchUpInside)

        setupConstraints()
        Transition.smoothAnimationPurple(subviews: view.subviews)

    }

    @objc func nextAction() {

        UserDefaults.standard.set(false, forKey: UserDefaultsHelper.Keys.isFirstTime)
        Seeder.shared.seedAll()
        MirrorData.startMirror()

        let dest = Environment.showDoubleColumnSplitViewController()!
        dest.modalPresentationStyle = .fullScreen
        Transition.animateTransition(vc: self)
        present(dest, animated: false)
    }

    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(pageControl.snp.top).offset(-50)
        }

        tableView.snp.makeConstraints { make in
            make.width.equalTo(ScreenSizes.screenWidth * 0.75)
            make.height.equalTo(80 * 3)
        }

        pageControl.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-60)
            make.height.equalTo(64)
            make.left.right.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
    }


}

extension InputTimeframeViewController: SettingDelegate {
    func setTimepickerValue(value: String, tag: Int) {
        switch tag {
        case 0:
            UserDefaults.standard.set(value, forKey: UserDefaultsHelper.Keys.morningTime)
            tableView.reloadRows(at: [IndexPath(row: 1, section: 0), IndexPath(row: 2, section: 0)], with: .none)
        case 1:
            UserDefaults.standard.set(value, forKey: UserDefaultsHelper.Keys.afternoonTime)
            tableView.reloadRows(at: [IndexPath(row: 0, section: 0), IndexPath(row: 2, section: 0)], with: .none)

        case 2:
            UserDefaults.standard.set(value, forKey: UserDefaultsHelper.Keys.eveningTime)
            tableView.reloadRows(at: [IndexPath(row: 0, section: 0), IndexPath(row: 1, section: 0)], with: .none)

        default:
            return
        }
    }
}

extension InputTimeframeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTimeTableViewCell.identifier) as! SettingTimeTableViewCell
        cell.delegate = self
        cell.backgroundColor = Colors.Neutral.white.withAlphaComponent(0.3)
        cell.titleLabel.textColor = Colors.Neutral.white
        cell.timePicker.setValue(Colors.Neutral.white, forKey: "backgroundColor")
        cell.timePicker.setValue(Colors.Brand.blueViolet, forKeyPath: "textColor")

        cell.timePicker.layer.cornerRadius = 8
        cell.timePicker.clipsToBounds = true

        switch indexPath.section {
        case 0:
            cell.titleLabel.attributedText = TextAttachments.leadingAttachment(imageName: Icons.morning, text: "Pagi", imageHeight: 20, colorName: Colors.Neutral.white)
            cell.timePicker.tag = indexPath.row
            cell.timePicker.date = Date().formatForDatepicker(value: UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.morningTime)!)
            cell.timePicker.minimumDate = Date().formatForDatepicker(value: "00:00")
            cell.timePicker.maximumDate = Date().formatForDatepicker(value: UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.afternoonTime)!)
        case 1:
            cell.titleLabel.attributedText = TextAttachments.leadingAttachment(imageName: Icons.afternoon, text: "Siang", colorName: Colors.Neutral.white)
            cell.timePicker.tag = indexPath.row
            cell.timePicker.date = Date().formatForDatepicker(value: UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.afternoonTime)!)
            cell.timePicker.minimumDate = Date().formatForDatepicker(value: UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.morningTime)!)
            cell.timePicker.maximumDate = Date().formatForDatepicker(value: UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.eveningTime)!)
        case 2:
            cell.titleLabel.attributedText = TextAttachments.leadingAttachment(imageName: Icons.night, text: "Malam", colorName: Colors.Neutral.white)
            cell.timePicker.tag = indexPath.row
            cell.timePicker.date = Date().formatForDatepicker(value: UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.eveningTime)!)
            cell.timePicker.minimumDate = Date().formatForDatepicker(value: UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.afternoonTime)!)
            cell.timePicker.maximumDate = Date().formatForDatepicker(value: "23:59")

        default:
            print("Loading Error")
        }

        return cell
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }

    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
