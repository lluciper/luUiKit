//
//  RewardsViewController.swift
//  LuUiKit
//
//  Created by VN Savis on 30/01/2024.
//

import UIKit
import MTBBarcodeScanner
import VisionKit

class RewardsViewController: UIViewController {
    
    var scannerAvailable: Bool {
        if #available(iOS 16.0, *) {
            return DataScannerViewController.isSupported && DataScannerViewController.isAvailable
        } else {
            return false
        }
    }
    
    @IBOutlet var previewView: UIView!
    var scanner: MTBBarcodeScanner?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scanner = MTBBarcodeScanner(previewView: previewView)
        
        // Alternatively, limit the type of codes you can scan:
        // scanner = MTBBarcodeScanner(metadataObjectTypes: [AVMetadataObject.ObjectType.qr.rawValue], previewView: previewView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        MTBBarcodeScanner.requestCameraPermission(success: { success in
            if success {
                do {
                    try self.scanner?.startScanning(resultBlock: { codes in
                        if let codes = codes {
                            for code in codes {
                                let stringValue = code.stringValue!
                                print("Found code: \(stringValue)")
                            }
                        }
                    })
                } catch {
                    NSLog("Unable to start scanning")
                }
            } else {
                //                    UIAlertView(title: "Scanning Unavailable", message: "This app does not have permission to access the camera", delegate: nil, cancelButtonTitle: nil, otherButtonTitles: "Ok").show()
                print("Error")
            }
        })
        
    }
    
    @IBAction func onScanner(_ sender: Any) {
        guard scannerAvailable == true else {
            print("Error: gigi do")
            return
        }
        
        if #available(iOS 16.0, *) {
            let dataScanner = DataScannerViewController(recognizedDataTypes: [.text(), .barcode()], isHighlightingEnabled: true)
                    dataScanner.delegate = self
            present(dataScanner, animated: true) {
                try? dataScanner.startScanning()
            }
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        self.scanner?.stopScanning()
        
        super.viewWillDisappear(animated)
    }
}

extension RewardsViewController: DataScannerViewControllerDelegate {
    
    @available(iOS 16.0, *)
    func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
        switch item {
        case .text(let text):
            print("text: ", text)
        case .barcode(let code):
            guard let string = code.payloadStringValue else {return}
            print("code string: ", string)
        default:
            print("default")
        }
    }
    
}
