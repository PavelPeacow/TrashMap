//
//  AddTrashViewController.swift
//  TrashMap
//
//  Created by Павел Кай on 26.04.2023.
//

import UIKit
import MobileCoreServices

class AddTrashViewController: UIViewController {
    
    var trashImage: UIImage? {
        didSet {
            setBtnState()
        }
    }
    
    var trashTitle: String? {
        didSet {
            setBtnState()
        }
    }
    
    var trashDescription: String? {
        didSet {
            setBtnState()
        }
    }
    
    var long: Double? {
        didSet {
            setBtnState()
        }
    }
    
    var lan: Double? {
        didSet {
            setBtnState()
        }
    }
    
    var trashVideo: Data? {
        didSet {
            setBtnState()
        }
    }
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var addImageView: UIMediaView = {
        let image = UIMediaView(mediaIcon: .init(systemName: "camera.fill")!)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var mainTitle: UILabel = {
        let label = UILabel()
        label.text = "Название"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var addTitleTextField: UIMainTextfield = {
        let textfield = UIMainTextfield(placeholder: "Название")
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.delegate = self
        textfield.addTarget(self, action: #selector(didTextfieldTitleEditingChanged), for: .editingChanged)
        return textfield
    }()
    
    lazy var descriptionTitle: UILabel = {
        let label = UILabel()
        label.text = "Описание"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var addDescriptionTextField: UIMainTextView = {
        let textView = UIMainTextView(placeholder: "Описание")
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.delegate = self
        return textView
    }()
    
    lazy var coordinatesTitle: UILabel = {
        let label = UILabel()
        label.text = "Координаты"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var getCoordinatesBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapGetCoordinatesBtn), for: .touchUpInside)
        return btn
    }()
    
    lazy var coordinatesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [addLongTextField, addLanTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 6
        return stackView
    }()
    
    lazy var addLongTextField: UIMainTextfield = {
        let textfield = UIMainTextfield(placeholder: "Долгота")
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.delegate = self
        textfield.addTarget(self, action: #selector(didTextfieldLongEditingChanged), for: .editingChanged)
        return textfield
    }()
    
    lazy var addLanTextField: UIMainTextfield = {
        let textfield = UIMainTextfield(placeholder: "Широта")
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.delegate = self
        textfield.addTarget(self, action: #selector(didTextfieldLanEditingChanged), for: .editingChanged)
        return textfield
    }()
    
    lazy var addVideoView: UIMediaView = {
        let view = UIMediaView(mediaIcon: .init(systemName: "video")!)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var submitBtn: UIMainButton = {
        let btn = UIMainButton(title: "Создать", color: .systemGreen)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapSubmitBtn), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        containerView.addSubview(addImageView)
        
        containerView.addSubview(mainTitle)
        containerView.addSubview(addTitleTextField)
        
        containerView.addSubview(descriptionTitle)
        containerView.addSubview(addDescriptionTextField)
        
        containerView.addSubview(coordinatesTitle)
        containerView.addSubview(getCoordinatesBtn)
        containerView.addSubview(coordinatesStackView)
        
        containerView.addSubview(addVideoView)
        
        containerView.addSubview(submitBtn)
        
        setBtnState()
        
        setCallbacks()
        setConstraints()
    }
    
    func setCallbacks() {
        addImageView.onTap = { [weak self] in
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            self?.present(picker, animated: true)
        }
        
        addVideoView.onTap = { [weak self] in
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.mediaTypes = [kUTTypeMovie as String]
            picker.delegate = self
            self?.present(picker, animated: true)
            
        }
    }
    
    private func isValidFields() -> Bool {
        guard let _ = trashImage else { return false }
        
        guard let trashTitle = trashTitle, !trashTitle.isEmpty else { return false }
        
        guard let trashDescription = trashDescription, !trashDescription.isEmpty else { return false }
        
        guard let _ = long else { return false }
        
        guard let _ = lan else { return false }
        
        //        guard let trashVideo = trashVideo else { return false }
        
        return true
    }
    
    func setBtnState() {
        if isValidFields() {
            submitBtn.alpha = 1
            submitBtn.isUserInteractionEnabled = true
        } else {
            submitBtn.alpha = 0.5
            submitBtn.isUserInteractionEnabled = false
        }
    }
    
}

extension AddTrashViewController {
    
    @objc func didTextfieldTitleEditingChanged(_ sender: UITextField) {
        trashTitle = sender.text
    }
    
    @objc func didTapGetCoordinatesBtn() {
        LocationManager.shared.requestLocation { [weak self] coordinate in
            self?.addLanTextField.text = String(coordinate.latitude.magnitude)
            self?.addLongTextField.text = String(coordinate.longitude.magnitude)
            self?.lan = coordinate.latitude.magnitude
            self?.long = coordinate.longitude.magnitude
            print(coordinate)
        }
    }
    
    @objc func didTextfieldLongEditingChanged(_ sender: UITextField) {
        long = Double(sender.text ?? "")
    }
    
    @objc func didTextfieldLanEditingChanged(_ sender: UITextField) {
        lan = Double(sender.text ?? "")
    }
    
    @objc func didTapSubmitBtn() {
#warning("ADD LOGIC")
        print("submit")
    }
    
}

extension AddTrashViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            addImageView.setMediaImage(image: image)
            trashImage = image
        }
        
        if let videoURL = info[.mediaURL] as? URL {
            print(videoURL)
        }
        
        dismiss(animated: true)
    }
    
}

extension AddTrashViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        
        let newHeight = newSize.height + 10
        
        textView.snp.updateConstraints { make in
            make.height.equalTo(newHeight)
        }
        
        UIView.animate(withDuration: 0.15) { [weak self] in
            self?.view.layoutIfNeeded()
        }
        
        trashDescription = textView.text
    }
    
}

extension AddTrashViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == addTitleTextField {
            let length = textField.text!.count - range.length + string.count
            return length <= 15
        }
        
        if textField == addLanTextField || textField == addLongTextField {
            let length = textField.text!.count - range.length + string.count
            return length <= 9
        }
        
        return true
    }
    
}

extension AddTrashViewController {
    
    func setConstraints() {
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        addImageView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(5)
            $0.topMargin.equalToSuperview().inset(6)
            $0.height.equalTo(200)
        }
        
        mainTitle.snp.makeConstraints {
            $0.top.equalTo(addImageView.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(50)
        }
        
        addTitleTextField.snp.makeConstraints {
            $0.top.equalTo(mainTitle.snp.bottom).offset(6)
            $0.horizontalEdges.equalToSuperview().inset(50)
            $0.height.equalTo(50)
        }
        
        descriptionTitle.snp.makeConstraints {
            $0.top.equalTo(addTitleTextField.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(50)
        }
        
        addDescriptionTextField.snp.makeConstraints {
            $0.top.equalTo(descriptionTitle.snp.bottom).offset(6)
            $0.horizontalEdges.equalToSuperview().inset(50)
            $0.height.equalTo(50)
        }
        
        coordinatesTitle.snp.makeConstraints {
            $0.top.equalTo(addDescriptionTextField.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(50)
            $0.trailing.lessThanOrEqualTo(getCoordinatesBtn.snp.leading).inset(5)
        }
        
        getCoordinatesBtn.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(50)
            $0.height.equalTo(50)
            $0.top.equalTo(addDescriptionTextField.snp.bottom).offset(5)
        }
        
        coordinatesStackView.snp.makeConstraints {
            $0.top.equalTo(coordinatesTitle.snp.bottom).offset(6)
            $0.horizontalEdges.equalToSuperview().inset(50)
        }
        
        addLongTextField.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        
        addLanTextField.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        
        addVideoView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(5)
            $0.top.equalTo(coordinatesStackView.snp.bottom).offset(16)
            $0.height.equalTo(200)
        }
        
        submitBtn.snp.makeConstraints {
            $0.top.equalTo(addVideoView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(80)
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview().inset(16)
        }
    }
    
}
