//
//  GoDevButton.swift
//  aula14Framework
//
//  Created by Rogério Tavares on 29/03/22.
//

import UIKit

public class GoDevButton: UIButton {
    
    private var config: Config {
        didSet {
            updateDisplay()
        }
    }
    
    public init(config: Config) {
        self.config = config
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        config = .light()
        super.init(coder: coder)
        configure()
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: 140, height: 40)
    }
    
    public override var isHighlighted: Bool {
        didSet {
            UIView.animate(
                withDuration: 0.1,
                delay: 0,
                options: [.beginFromCurrentState, .curveEaseOut]) {
                    self.backgroundColor = self.isHighlighted ? self.config.hignlightedBackgroundColor : self.config.backgroundColor
                    
                    self.applyShadow(shadow: self.isHighlighted ? .pressed() : .standard())
                    
                    self.transform = self.isHighlighted ? .init(translationX: 0, y: 1) : .identity
                }
            
        }
    }
    
    private func configure() {
        layer.cornerRadius = 6
        titleLabel?.font = UIFont.systemFont(ofSize: 14)
        applyShadow(shadow: .standard())
        updateDisplay()
    }
    
    private func updateDisplay() {
        backgroundColor = config.backgroundColor
        setTitleColor(config.foregroundColor, for: .normal)
    }
    
    private func applyShadow(shadow: Shadow) {
        layer.shadowOffset = shadow.offset
        layer.shadowColor = shadow.color.cgColor
        layer.shadowRadius = shadow.radius
        layer.shadowOpacity = shadow.opacity
        
    }
    
}

public extension GoDevButton {
    struct Config {
        public let backgroundColor: UIColor
        public let hignlightedBackgroundColor: UIColor
        public let foregroundColor: UIColor
        
        public static func light() -> Config {
            Config(
                backgroundColor: .white,
                hignlightedBackgroundColor: UIColor(red: 0.98, green: 0.98, blue: 1, alpha: 1),
                foregroundColor: UIColor(red: 0.25, green: 0.27, blue: 0.38, alpha: 1)
            )
        }
        
        public static func dark() -> Config {
            Config(
                backgroundColor: UIColor(red: 0.12, green: 0.13, blue: 0.21, alpha: 1),
                hignlightedBackgroundColor: UIColor(red: 0.09, green: 0.09, blue: 0.15, alpha: 1),
                foregroundColor: UIColor(red: 0.98, green: 0.98, blue: 1, alpha: 1)
            )
        }
    }
    
    struct Shadow {
        public let offset: CGSize
        public let radius: CGFloat
        public let color: UIColor
        public let opacity: Float
        
        public static func standard() -> Shadow {
            Shadow(
                offset: .init(width: 0, height: 2),
                radius: 3,
                color: UIColor(red: 0, green: 0.07, blue: 0.52, alpha: 1),
                opacity: 0.2
            )
        }
        
        public static func pressed() -> Shadow {
            Shadow(
                offset: .init(width: 0, height: 1),
                radius: 1,
                color: UIColor(red: 0, green: 0.07, blue: 0.52, alpha: 1),
                opacity: 0.2
            )
        }
    }
}
