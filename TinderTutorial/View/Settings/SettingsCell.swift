//
//  SettingsCell.swift
//  TinderTutorial
//
//  Created by 민호 on 2022/05/17.
//

import UIKit

protocol SettingCellDelegate: class {
    func settingCell(_ cell: SettingsCell, wantsToUpdateUserWith value: String, for Section: SettingsSections)
    
    func settingCell(_ cell: SettingsCell, wantsToUpdateAgeRangeWith sender: UISlider)
}

class SettingsCell: UITableViewCell, UITextFieldDelegate {
    
    // MARK: - Properties
    
    weak var delegate: SettingCellDelegate?
    
    var viewModel: SettingViewModel! {
        didSet { configure() }
    }
    
    lazy var inputField: UITextField = {
        let tf = UITextField()
        
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        
        tf.placeholder = "Enter value here..."
        
        let paddingView = UIView()
        paddingView.setDimensions(height: 50, width: 28)
        tf.leftView = paddingView
        tf.leftViewMode = .always
        
        tf.addTarget(self, action: #selector(handleUpdateUserInfo), for: .editingDidEnd)
        
        return tf
    }()
    
    var sliderStack = UIStackView()
    
    let minLabel = UILabel()
    let maxLabel = UILabel()
    
    lazy var minAgeSlider = createAgeRangeSlider()
    lazy var maxAgeSlider = createAgeRangeSlider()
    
    
    
    // MARK: - LifeCycle
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        contentView.addSubview(inputField)
        inputField.fillSuperview()
        
        let minStack = UIStackView(arrangedSubviews: [minLabel, minAgeSlider])
        minStack.spacing = 24
        
        let maxStack = UIStackView(arrangedSubviews: [maxLabel, maxAgeSlider])
        maxStack.spacing = 24
        
        sliderStack = UIStackView(arrangedSubviews: [minStack, maxStack])
        sliderStack.axis = .vertical
        sliderStack.spacing = 16
        
        addSubview(sliderStack)
        sliderStack.centerY(inView: self)
        sliderStack.anchor(left: leftAnchor, right: rightAnchor, paddingLeft: 24,
        paddingRight: 24)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc func handleUpdateUserInfo(sender: UITextField) {
        guard let value = sender.text else { return }
        delegate?.settingCell(self, wantsToUpdateUserWith: value, for: viewModel.section)
    }
                                 
    @objc func handleAgeRangeChanged(sender: UISlider) {
        if sender == minAgeSlider {
            minLabel.text = viewModel.minAgeLabelText(forValue: sender.value)
        } else {
            maxLabel.text = viewModel.maxAgeLabelText(forValue: sender.value)
        }
        
        delegate?.settingCell(self, wantsToUpdateAgeRangeWith: sender)
    }
    

    

    
    // MARK: - Helpers
    
    func configure() {
        inputField.isHidden = viewModel.shouldHideInputField
        sliderStack.isHidden = viewModel.shouldHideSlider
        
        inputField.placeholder = viewModel.placeholderText
        inputField.text = viewModel.value
        
        minLabel.text = viewModel.minAgeLabelText(forValue: viewModel.minAgeSliderValue)
        maxLabel.text = viewModel.maxAgeLabelText(forValue: viewModel.maxAgeSliderValue)

        
        minAgeSlider.setValue(viewModel.minAgeSliderValue, animated: true)
        maxAgeSlider.setValue(viewModel.maxAgeSliderValue, animated: true)
    
    }
    
    func createAgeRangeSlider() -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 18
        slider.maximumValue = 60
        slider.addTarget(self, action: #selector(handleAgeRangeChanged), for: .valueChanged)
        return slider
    }
}


