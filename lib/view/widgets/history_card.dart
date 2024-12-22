part of 'widgets.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.journalTitle,
    required this.journalDate,
    required this.categoryValue, // Nilai kategori (0-100)
    this.onTap,
  });

  final String journalTitle;
  final String journalDate;
  final int categoryValue; // Tipe data diubah menjadi int
  final VoidCallback? onTap;

  Color getCategoryColor() {
    if (categoryValue >= 0 && categoryValue <= 40) {
      return Color(0xff3BA79E);
    } else if (categoryValue > 40 && categoryValue <= 80) {
      return Color(0xff3EABE00);
    } else if (categoryValue > 80 && categoryValue <= 100) {
      return Color(0xffF65A48);
    } else {
      return Colors.grey; // Warna default jika nilai di luar rentang
    }
  }

  Color getBackgroundColor() {
    if (categoryValue >= 0 && categoryValue <= 40) {
      return Color(0xffAFE1DB); // Warna latar belakang untuk kategori 0-40
    } else if (categoryValue > 40 && categoryValue <= 80) {
      return Color(0xffF4E5A7); // Warna latar belakang untuk kategori 41-80
    } else if (categoryValue > 80 && categoryValue <= 100) {
      return Color(0xffF5C3BD); // Warna latar belakang untuk kategori 81-100
    } else {
      return Colors.grey.shade300; // Warna default jika nilai di luar rentang
    }
  }

  String getIcon() {
    if (categoryValue >= 0 && categoryValue <= 40) {
      return 'assets/images/happy.png';
    } else if (categoryValue > 40 && categoryValue <= 80) {
      return 'assets/images/plain.png';
    } else if (categoryValue > 80 && categoryValue <= 100) {
      return 'assets/images/angry.png';
    } else {
      return ""; // Warna default jika nilai di luar rentang
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: getBackgroundColor(), // Menambahkan latar belakang warna berdasarkan kategori
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0), // Tambahkan padding kiri
              child: Container(
                width: 8,
                height: 80, // Lebar kotak kategori
                decoration: BoxDecoration(
                  color: getCategoryColor(),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            journalTitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            journalDate,
                            style: GoogleFonts.poppins(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.arrow_forward_ios,
                          shadows: [], // Menghilangkan shadow pada icon
                        ),
                        const SizedBox(height: 10),
                        Image.asset(
                          getIcon(),
                          height: 40,
                          width: 40,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}