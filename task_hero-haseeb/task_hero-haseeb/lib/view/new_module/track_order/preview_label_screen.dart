import 'package:cocoon/res/constants/app_colors.dart';
import 'package:cocoon/res/constants/imports.dart';
import 'package:cocoon/view/new_module/track_order/widgets/custom_outline_button.dart';

class PreviewLabelScreen extends StatelessWidget {
  const PreviewLabelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        centerTitle: false,
        title: const Text(
          "Tracking Details",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.black1),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/more.svg"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ORDERED BY",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Bilal Khan Yousafzai",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Ecome Express",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        10.h,
                        Image.asset(
                          "assets/images/barcode2.png",
                          width: 140,
                        ),
                        5.h,
                        const Text(
                          "9854565656256456",
                          style: TextStyle(fontSize: 12, color: Colors.black87),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(
              thickness: 1,
              height: 32,
              color: Colors.grey,
            ),
            const Text(
              "ORDERED DETAILS",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            _buildOrderDetails(),
            const Divider(
              thickness: 1,
              height: 32,
              color: Colors.grey,
            ),
            _buildOrderTable(),
            const Divider(
              thickness: 1,
              height: 32,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildAddressColumn(
                  title: "By",
                  name: "AJX Cloths",
                  address: "1456 Veltri Drive,\nAnchorage, AK 99502",
                ),
                _buildAddressColumn(
                  title: "Delivered to",
                  name: "Bilal Khan Yousafzai",
                  address: "1456 Veltri Drive,\nAnchorage, AK 99502",
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              height: 32,
              color: Colors.grey,
            ),
            const Text(
              "Note:",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus porta mi et nulla sollicitudin, et tristique leo tristique. Pellentesque porttitor mi eget dapibus hendrerit.",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            10.h,
            SizedBox(
              width: double.infinity,
              child: CustomOutlineButton(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  onPressed: () {
                    Get.to(() => const PreviewLabelScreen());
                  },
                  backgroundColor: Colors.grey.shade300,
                  borderColor: Colors.grey.shade300,
                  textColor: AppColors.p1,
                  icon: SvgPicture.asset(
                    "assets/icons/print.svg",
                    color: AppColors.p1,
                  ),
                  label: "Print label"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow("Name:", "Bilal Khan"),
                  _buildDetailRow("SKU:", "#564525"),
                  _buildDetailRow("Order ID:", "#7354836"),
                  _buildDetailRow("Order Date:", "4/1/2022"),
                ],
              ),
            ),
            5.w,
            //
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow("Dimension:", "inches"),
                  _buildDetailRow("Size:", "3 x 4 x 4"),
                  _buildDetailRow("Quantity:", "2"),
                  _buildDetailRow("Invoice Date:", "26/12/2022"),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderTable() {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(3),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(2),
        4: FlexColumnWidth(2),
        5: FlexColumnWidth(2),
      },
      border: TableBorder.symmetric(
        inside: BorderSide(color: Colors.grey.shade300),
      ),
      children: [
        _buildTableHeader(),
        _buildTableRow("Product name", "\$363", "2", "16%", "-\$0.0", "\$387"),
        _buildTableRow("Other cost", "\$467", "1", "16%", "-\$0.0", "\$489"),
        _buildTableTotalRow("Total", "\$957"),
      ],
    );
  }

  TableRow _buildTableTotalRow(String label, String total) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        const TableCell(
          child: SizedBox.shrink(),
        ),
        const TableCell(
          child: SizedBox.shrink(),
        ),
        const TableCell(
          child: SizedBox.shrink(),
        ),
        const TableCell(
          child: SizedBox.shrink(),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              total,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey.shade100),
      children: [
        _buildTableCell("Description", isHeader: true),
        _buildTableCell("Price", isHeader: true),
        _buildTableCell("Qty", isHeader: true),
        _buildTableCell("GSTIN", isHeader: true),
        _buildTableCell("Discount", isHeader: true),
        _buildTableCell("Total", isHeader: true),
      ],
    );
  }

  TableRow _buildTableRow(String desc, String price, String qty, String gstin,
      String discount, String total) {
    return TableRow(
      children: [
        _buildTableCell(desc),
        _buildTableCell(price),
        _buildTableCell(qty),
        _buildTableCell(gstin),
        _buildTableCell(discount),
        _buildTableCell(total),
      ],
    );
  }

  // TableRow _buildTableTotalRow(String desc, String total) {
  //   return TableRow(
  //     children: [
  //       _buildTableCell(desc, isHeader: true, colSpan: 5),
  //       _buildTableCell(total, isHeader: true),
  //     ],
  //   );
  // }

  Widget _buildTableCell(String text,
      {bool isHeader = false, int colSpan = 1}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        text,
        textAlign: colSpan > 1 ? TextAlign.right : TextAlign.left,
        style: TextStyle(
          fontSize: 12,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildAddressColumn(
      {required String title, required String name, required String address}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            address,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
