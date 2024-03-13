import UIKit
import CoreImage

class QRTest: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Gọi hàm để chọn ảnh từ thư viện ảnh
        choosePhotoFromLibrary()
    }

    func choosePhotoFromLibrary() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else {
            print("Không tìm thấy ảnh.")
            return
        }

        // Gọi hàm để quét mã QR từ ảnh được chọn
        if let qrCode = scanQRCode(image: image) {
            print("QR Code: \(qrCode)")
        } else {
            print("Không tìm thấy mã QR trong ảnh.")
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func scanQRCode(image: UIImage) -> String? {
        guard let ciImage = CIImage(image: image) else { return nil }

        let options: [String: Any] = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
        let qrDetector = CIDetector(ofType: CIDetectorTypeQRCode, context: nil, options: options)

        let features = qrDetector?.features(in: ciImage)

        if let qrFeature = features?.first as? CIQRCodeFeature {
            return qrFeature.messageString
        }

        return nil
    }
}

import UIKit
import Vision

    class QRTest2: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        @IBOutlet weak var imageView: UIImageView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }

        // Function to present image picker
        @IBAction func selectImageButtonTapped(_ sender: UIButton) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }

        // Image picker delegate method
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true, completion: nil)
            
            guard let image = info[.originalImage] as? UIImage else {
                print("Could not get image from picker.")
                return
            }
            
            // Perform QR code detection on selected image
            detectQRCode(image: image)
        }

        // Function to perform QR code detection
        func detectQRCode(image: UIImage) {
            guard let ciImage = CIImage(image: image) else {
                print("Could not convert UIImage to CIImage.")
                return
            }
            
            let request = VNDetectBarcodesRequest { request, error in
                guard error == nil else {
                    print("Error detecting barcodes: \(error!.localizedDescription)")
                    return
                }
                
                guard let results = request.results as? [VNBarcodeObservation] else {
                    print("No barcode observations found.")
                    return
                }
                
                for result in results {
                    if let payloadString = result.payloadStringValue {
                        print("Detected QR code with payload: \(payloadString)")
                        
                        let boundingBox = result.boundingBox
                        let imageRect = image.size
                        let boundingBoxRect = VNImageRectForNormalizedRect(boundingBox, Int(imageRect.width), Int(imageRect.height))
                        
                        DispatchQueue.main.async {
                            // Crop and display the QR code area
                            if let croppedImage = self.crop(image: image, rect: boundingBoxRect) {
                                self.imageView.image = croppedImage
                                print("Cropped QR code image displayed.")
                            }
                        }
                    }
                }
            }
            
            let handler = VNImageRequestHandler(ciImage: ciImage)
            do {
                try handler.perform([request])
            } catch {
                print("Error performing request: \(error.localizedDescription)")
            }
        }

        // Function to crop image based on CGRect
        func crop(image: UIImage, rect: CGRect) -> UIImage? {
            guard let cgImage = image.cgImage?.cropping(to: rect) else {
                return nil
            }
            return UIImage(cgImage: cgImage)
        }
    }
