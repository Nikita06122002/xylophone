//
//  MainView.swift
//  Xylophone
//
//  Created by macbook on 30.10.2023.
//

import UIKit
import AVKit

final class MainView: UIView {
    
    
    init() {
        super.init(frame: .infinite)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var player = AVAudioPlayer()
    
    private let view1 = UIView(backgroundColor: .clear)
    private let c = UIButton(titleLabel: "C", backroundColor: .red)
    private let d = UIButton(titleLabel: "D", backroundColor: .orange)
    private let e = UIButton(titleLabel: "E", backroundColor: .yellow)
    private let f = UIButton(titleLabel: "F", backroundColor: .green)
    private let g = UIButton(titleLabel: "G", backroundColor: .systemIndigo)
    private let a = UIButton(titleLabel: "A", backroundColor: .blue)
    private let b = UIButton(titleLabel: "B", backroundColor: .purple)
    
    private lazy var stackView = UIStackView(axis: .vertical, spacing: 10, aligment: .fill, distribution: .equalSpacing, addArrangeSubVeiws: [c,d,e,f,g,a,b])
    
    
    private func setupView() {
        
        self.addSubview(view1)
        view1.addSubview(stackView)
        NSLayoutConstraint.activate([
            
            
            view1.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            view1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view1.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view1.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            
            stackView.topAnchor.constraint(equalTo: view1.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view1.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view1.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view1.trailingAnchor, constant: -5),
            
            c.topAnchor.constraint(equalTo: stackView.topAnchor),
            c.leadingAnchor.constraint (equalTo: stackView.leadingAnchor, constant: 5),
            c.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -5),
            c.heightAnchor.constraint(equalToConstant: 97),

            
            d.topAnchor.constraint(equalTo: c.bottomAnchor, constant: 5),
            d.leadingAnchor.constraint (equalTo: stackView.leadingAnchor, constant: 15),
            d.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -15),
            d.heightAnchor.constraint(equalToConstant: 97),

            
            e.topAnchor.constraint(equalTo: d.bottomAnchor, constant: 5),
            e.leadingAnchor.constraint (equalTo: stackView.leadingAnchor, constant: 25),
            e.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -25),
            e.heightAnchor.constraint(equalToConstant: 97),

            
            f.topAnchor.constraint(equalTo: e.bottomAnchor, constant: 5),
            f.leadingAnchor.constraint (equalTo: stackView.leadingAnchor, constant: 35),
            f.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -35),
            f.heightAnchor.constraint(equalToConstant: 97),

            
            g.topAnchor.constraint(equalTo: f.bottomAnchor, constant: 5),
            g.leadingAnchor.constraint (equalTo: stackView.leadingAnchor, constant: 45),
            g.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -45),
            g.heightAnchor.constraint(equalToConstant: 97),

            
            a.topAnchor.constraint(equalTo: g.bottomAnchor, constant: 5),
            a.leadingAnchor.constraint (equalTo: stackView.leadingAnchor, constant: 55),
            a.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -55),
            a.heightAnchor.constraint(equalToConstant: 97),

            
            b.topAnchor.constraint(equalTo: a.bottomAnchor, constant: 5),
            b.leadingAnchor.constraint (equalTo: stackView.leadingAnchor, constant: 65),
            b.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -65),
            b.bottomAnchor.constraint(lessThanOrEqualTo: stackView.bottomAnchor, constant: -5),
            b.heightAnchor.constraint(equalToConstant: 97)

            
        ])
        c.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        d.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        e.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        f.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        g.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        a.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        b.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
    }
    
    func playSound(_ soundName: String, _ extensions: String) {
        if let url = Bundle.main.url(forResource: soundName, withExtension: extensions) {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.play()
            } catch let error {
                print("AVAudioPlayer error: \(error.localizedDescription)")
            }
        } else {
            print("URL for sound not found.")
        }
    }
    
    
    @objc func buttonPressed(_ sender: UIButton) {

        if let text = sender.titleLabel?.text {
            playSound(text, "wav")
            sender.alpha = 0.5
            UIView.animate(withDuration: 0.01) {
                sender.alpha = 1
            }
        }

    }
}
