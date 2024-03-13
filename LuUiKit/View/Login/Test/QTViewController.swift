//
//  QTViewController.swift
//  LuUiKit
//
//  Created by VN Savis on 08/03/2024.
//

import UIKit
import MLKit
import AVFoundation

class QTViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Tạo một UIButton để chọn hình ảnh
        let button = UIButton(type: .system)
        button.setTitle("Choose Image", for: .normal)
        button.addTarget(self, action: #selector(chooseImage), for: .touchUpInside)
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        view.addSubview(button)
    }
    
    @objc func chooseImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            selectedImage = image
            //            divideImageAndExtractQR()
            mlkitt()
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func divideImageAndExtractQR() {
        //        guard let image = selectedImage else { return }
        
    }
    
    func buffers(_ image: UIImage) -> CMSampleBuffer? {
        guard let imageData = image.pngData() else { return nil }
        
        let options: [String: Any] = [
            kCVPixelBufferCGImageCompatibilityKey as String: true,
            kCVPixelBufferCGBitmapContextCompatibilityKey as String: true
        ]
        
        var pixelBuffer: CVPixelBuffer?
        let status = CVPixelBufferCreate(
            kCFAllocatorDefault,
            Int(image.size.width),
            Int(image.size.height),
            kCVPixelFormatType_32ARGB,
            options as CFDictionary,
            &pixelBuffer
        )
        
        guard status == kCVReturnSuccess, let finalPixelBuffer = pixelBuffer else { return nil }
        
        CVPixelBufferLockBaseAddress(finalPixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
        let pixelData = CVPixelBufferGetBaseAddress(finalPixelBuffer)
        
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        guard let context = CGContext(
            data: pixelData,
            width: Int(image.size.width),
            height: Int(image.size.height),
            bitsPerComponent: 8,
            bytesPerRow: CVPixelBufferGetBytesPerRow(finalPixelBuffer),
            space: rgbColorSpace,
            bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue
        ) else { return nil }
        
        context.translateBy(x: 0, y: image.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        
        UIGraphicsPushContext(context)
        image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        UIGraphicsPopContext()
        CVPixelBufferUnlockBaseAddress(finalPixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
        
        var timingInfo: CMSampleTimingInfo = CMSampleTimingInfo(duration: CMTime(), presentationTimeStamp: CMTime(), decodeTimeStamp: CMTime())
        var videoInfo: CMVideoFormatDescription?
        CMVideoFormatDescriptionCreateForImageBuffer(
            allocator: kCFAllocatorDefault,
            imageBuffer: finalPixelBuffer,
            formatDescriptionOut: &videoInfo
        )
        
        var sampleBuffer: CMSampleBuffer?
        CMSampleBufferCreateReady(
            allocator: kCFAllocatorDefault,
            dataBuffer: nil,
            formatDescription: videoInfo,
            sampleCount: 1,
            sampleTimingEntryCount: 1,
            sampleTimingArray: &timingInfo,
            sampleSizeEntryCount: 0,
            sampleSizeArray: nil,
            sampleBufferOut: &sampleBuffer
        )
        
        return sampleBuffer
    }
    
    func mlkitt(){
        let options = ObjectDetectorOptions()
        options.detectorMode = .singleImage
        options.shouldEnableMultipleObjects = true
        options.shouldEnableClassification = true
        let objectDetector = ObjectDetector.objectDetector(options: options)
        
        
        let image = VisionImage(image: selectedImage!)
        
        
        DispatchQueue.global().async {
            var objects: [Object]
            do {
                objects = try objectDetector.results(in: image)
            } catch let error {
                print("Failed to detect object with error: \(error.localizedDescription).")
                return
            }
            guard !objects.isEmpty else {
                print("Object detector returned no results.")
                return
            }
            
            for object in objects {
                let frame = object.frame
                let trackingID = object.trackingID
                
                let description = object.labels.enumerated().map { (index, label) in
                    "Label \(index): \(label.text), \(label.confidence)"
                }.joined(separator:"\n")
                print("dsdasd: ",frame)
                print("dsdasd: ",trackingID)
                print("dsdasd: ",description)
         
                if let image = self.selectedImage {
                    let croppedImages = self.cropImage(image: image, frame: CGRect(x: frame.minX - 10, y: frame.minY - 10, width: frame.width + 30, height: frame.height + 30))
                    // Use the cropped image
                    if let croppedImage = croppedImages {
                        self.saveImageToLibrary(croppedImage)
                        if let inputImage = croppedImage ?? nil {
                            if let outputImage = denoiseImageAfterCropping(inputImage) {
                                self.saveImageToLibrary(outputImage)
                            } else {
                                print("Could not enhance image.")
                            }
                        } else {
                            print("Could not load input image.")
                        }
                    } else {
                        print("Failed to crop the image")
                    }
                } else {
                    print("Failed to load the image")
                }
            }

                       
        
        DispatchQueue.main.async {
            // Cập nhật giao diện người dùng nếu cần
        }
    }
        
        func frameToListInt(_ frame: String)-> [Int]{
            let stringCoordinates = frame
            let cleanString = stringCoordinates.replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")
            let stringValues = cleanString.components(separatedBy: ",")
            let intValues = stringValues.compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
            return intValues
        }
    
        func denoiseImageAfterCropping(_ inputImage: UIImage) -> UIImage? {
            guard let ciImage = CIImage(image: inputImage) else {
                return nil
            }
            let noiseReductionFilter = CIFilter(name: "CINoiseReduction")
            noiseReductionFilter?.setValue(ciImage, forKey: kCIInputImageKey)
            noiseReductionFilter?.setValue(0.02, forKey: "inputNoiseLevel")
            noiseReductionFilter?.setValue(0.4, forKey: "inputSharpness")
            guard let denoisedImage = noiseReductionFilter?.outputImage else {
                return nil
            }
            let context = CIContext(options: nil)
            guard let cgImage = context.createCGImage(denoisedImage, from: denoisedImage.extent) else {
                return nil
            }
            let outputImage = UIImage(cgImage: cgImage)
            return outputImage
        }

}

func cropImage(image: UIImage, frame: CGRect) -> UIImage? {
    let scale = image.scale
    let scaledFrame = CGRect(x: frame.origin.x * scale,
                             y: frame.origin.y * scale,
                             width: frame.size.width * scale,
                             height: frame.size.height * scale)
    UIGraphicsBeginImageContextWithOptions(scaledFrame.size, false, 0)
    let translation = CGPoint(x: -scaledFrame.origin.x, y: -scaledFrame.origin.y)
    image.draw(at: translation)
    let croppedImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return croppedImage
}

func saveImageToLibrary(_ image: UIImage) {
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
}

func imageOrientation(
    deviceOrientation: UIDeviceOrientation,
    cameraPosition: AVCaptureDevice.Position
) -> UIImage.Orientation {
    switch deviceOrientation {
    case .portrait:
        return cameraPosition == .front ? .leftMirrored : .right
    case .landscapeLeft:
        return cameraPosition == .front ? .downMirrored : .up
    case .portraitUpsideDown:
        return cameraPosition == .front ? .rightMirrored : .left
    case .landscapeRight:
        return cameraPosition == .front ? .upMirrored : .down
    case .faceDown, .faceUp, .unknown:
        return .up
        
    }
}

}
