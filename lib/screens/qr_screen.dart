import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScreen extends StatefulWidget {
  final MobileScannerController controller = MobileScannerController();

  QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  bool isScanning = false;
  String? scannedResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR'),),
      body: Center(
        child: isScanning
            ? MobileScanner(
                controller: widget.controller,
                onDetect: (BarcodeCapture capture) {
                  final List<Barcode> barcodes = capture.barcodes;
                  for (final barcode in barcodes) {
                    final String? code = barcode.rawValue;
                    if (code != null) {
                      setState(() {
                        scannedResult = code; // Almacena el resultado escaneado
                        isScanning = false; // Cierra la cámara
                      });
                    }
                  }
                },
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (scannedResult != null) ...[
                    Text(
                      scannedResult.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                  ],
                  ElevatedButton(
                    child: const Text('Scan QR code'),
                    onPressed: () {
                      setState(() {
                        isScanning = true; // Abre la cámara
                        scannedResult = null; // Resetea el resultado
                      });
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
