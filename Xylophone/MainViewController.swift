//
//  ViewController.swift
//  Xylophone
//
//  Created by Иван Карплюк on 28.01.2023.
//

import UIKit
import AVFoundation

final class MainViewController: UIViewController {
    
    private var player: AVAudioPlayer!
    
    private lazy var buttonC: UIButton = {
        let button = UIButton()
        button.setTitle("C", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(playsound), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonD: UIButton = {
        let button = UIButton()
        button.setTitle("D", for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(playsound), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonE: UIButton = {
        let button = UIButton()
        button.setTitle("E", for: .normal)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(playsound), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonF: UIButton = {
        let button = UIButton()
        button.setTitle("F", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(playsound), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonG: UIButton = {
        let button = UIButton()
        button.setTitle("G", for: .normal)
        button.backgroundColor = .systemIndigo
        button.addTarget(self, action: #selector(playsound), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonA: UIButton = {
        let button = UIButton()
        button.setTitle("A", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(playsound), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonB: UIButton = {
        let button = UIButton()
        button.setTitle("B", for: .normal)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(playsound), for: .touchUpInside)
        return button
    }()
    
    private lazy var stack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [buttonC, buttonD, buttonE, buttonF, buttonG, buttonA, buttonB])
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupConstraints()
    }
    
    @objc
    private func playsound(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

    //MARK: - play sound func

extension MainViewController {
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = AVAudioPlayer(contentsOf: url!)
        player.play()
    }}

