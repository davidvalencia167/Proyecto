import 'package:flutter/material.dart';

class CompletePurchaseScreen extends StatefulWidget {
  const CompletePurchaseScreen({Key? key}) : super(key: key);

  @override
  _CompletePurchaseScreenState createState() => _CompletePurchaseScreenState();
}

class _CompletePurchaseScreenState extends State<CompletePurchaseScreen> {
  bool _saveAddressForFutureOrders = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Information'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Shopping Information Form
              const Text(
                'Shopping Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildTextField('Name'),
              const SizedBox(height: 16),
              _buildTextField('Address'),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildTextField('City')),
                  const SizedBox(width: 16),
                  Expanded(child: _buildTextField('State')),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildTextField('Zip Code')),
                  const SizedBox(width: 16),
                  Expanded(child: _buildTextField('Phone Number')),
                ],
              ),
              const SizedBox(height: 16),
              _buildTextField('Email'),
              const SizedBox(height: 16),

              // Save Address Checkbox
              Row(
                children: [
                  Checkbox(
                    value: _saveAddressForFutureOrders,
                    onChanged: (bool? value) {
                      setState(() {
                        _saveAddressForFutureOrders = value ?? false;
                      });
                    },
                  ),
                  const Text('Save Address for future orders'),
                ],
              ),

              const SizedBox(height: 32),

              // Order Summary
              const Text(
                'Order Summary',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildOrderSummaryRow('Product 1', '\$20.00'),
              _buildOrderSummaryRow('Product 2', '\$115.00'),
              _buildOrderSummaryRow('Subtotal', '\$135.00'),
              _buildOrderSummaryRow('Shipping Cost', '\$5.00'),
              const Divider(height: 32, thickness: 1),
              _buildOrderSummaryRow('Total Cost', '\$140.00', isBold: true),

              const SizedBox(height: 32),

              // Complete Purchase Button
              ElevatedButton(
                onPressed: () {
                  // Complete purchase logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Complete Purchase',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
    );
  }

  Widget _buildOrderSummaryRow(String label, String amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}