import 'package:flutter/material.dart';

class MyTripPage extends StatelessWidget {
  // Phần style cho tiêu đề
  TextStyle _headerTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
  }

  // Hàm hiển thị hình ảnh nền
  Widget _buildHeaderImage() {
    return Image.asset(
      'images/image 3.png',
      width: double.infinity,
      height: 200,
      fit: BoxFit.cover,
      semanticLabel: 'Header Image',
    );
  }

  // Hàm xây dựng phần thông tin địa điểm
  Widget _buildLocationInfo(IconData icon, String info) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        SizedBox(width: 8), // Tăng khoảng cách giữa biểu tượng và văn bản
        Text(info, style: TextStyle(color: Colors.white)),
      ],
    );
  }

  // Hàm xây dựng phần nội dung của header
  Widget _buildHeaderContent() {
    return Positioned(
      top: 30,
      left: 16,
      right: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Home', style: _headerTextStyle()),
              const SizedBox(height: 3),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildLocationInfo(Icons.location_on, 'Da Nang'),
              _buildLocationInfo(Icons.wb_sunny, '26°C'),
            ],
          ),
        ],
      ),
    );
  }

  // Hàm xây dựng phần header hoàn chỉnh
  Widget _buildHeader() {
    return Stack(
      children: [
        _buildHeaderImage(), // Hình ảnh nền
        _buildHeaderContent(), // Nội dung header
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Số lượng tab
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, 
           toolbarHeight: 0, // Ngăn hiển thị nút quay lại
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max, // Thay đổi kích thước chính
          children: [
            _buildHeader(), // Gọi phần header đầu tiên
            Container(
              color: Colors.white, // Màu nền cho TabBar
              child: TabBar(
                labelColor: Colors.green,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: 'Current Trips'),
                  Tab(text: 'Next Trips'),
                  Tab(text: 'Past Trips'),
                  Tab(text: 'Wish List'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CurrentTripsTab(),
                  NextTripsTab(),
                  PastTripsTab(),
                  WishListTab(),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Xử lý khi nhấn nút FAB
          },
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

// Tab cho Current Trips
class CurrentTripsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        TripCard(
          title: 'Dragon Bridge Trip',
          date: 'Jan 30, 2020',
          time: '13:00 - 15:00',
          person: 'Tuan Tran',
          location: 'Da Nang, Vietnam',
          imageUrl: 'images/6.png',
          avatarUrl: 'images/2.png', // Đường dẫn hình ảnh cục bộ
        ),
         // Thêm các TripCard khác nếu cần
      ],
    );
  }
}
class NextTripsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        TripCard1(
          title: 'Dragon Bridge Trip',
          date: 'Jan 30, 2020',
          time: '13:00 - 15:00',
          person: 'Tuan Tran',
          location: 'Da Nang, Vietnam',
          imageUrl: 'images/6.png',
          avatarUrl: 'images/2.png', // Đường dẫn hình ảnh cục bộ
        ),
         // Thêm các TripCard khác nếu cần
      ],
    );
  }
}
class PastTripsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        TripCard2(
          title: 'Dragon Bridge Trip',
          date: 'Jan 30, 2020',
          time: '13:00 - 15:00',
          person: 'Tuan Tran',
          location: 'Da Nang, Vietnam',
          imageUrl: 'images/6.png',
          avatarUrl: 'images/2.png', // Đường dẫn hình ảnh cục bộ
        ),
         // Thêm các TripCard khác nếu cần
      ],
    );
  }
}

class WishListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        TripCard3(
          title: 'Dragon Bridge Trip',
          date: 'Jan 30, 2020',
          time: '13:00 - 15:00',
          person: 'Tuan Tran',
          location: 'Da Nang, Vietnam',
          imageUrl: 'images/6.png',
          avatarUrl: 'images/2.png', // Đường dẫn hình ảnh cục bộ
        ),
         // Thêm các TripCard khác nếu cần
      ],
    );
  }
}



class TripCard extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String person;
  final String location;
  final String imageUrl;
  final String avatarUrl; // Thêm biến avatarUrl

  TripCard({
    required this.title,
    required this.date,
    required this.time,
    required this.person,
    required this.location,
    required this.imageUrl,
    required this.avatarUrl, // Thêm avatarUrl vào constructor
  });

  @override
   Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  'images/6.png',
                  width: double.infinity,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.blue, size: 16),
                      SizedBox(width: 5),
                      Text(
                        'Mark Finished',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  // decoration: BoxDecoration(
                  //   color: Colors.black.withOpacity(0.5),
                  //   borderRadius: BorderRadius.circular(20),
                  // ),
                  child: Row(
                    children: const [
                      Icon(Icons.location_on, color: Colors.white, size: 16),
                      SizedBox(width: 5),
                      Text(
                        'Da Nang, Vietnam',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Stack(
  children: [
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dragon Bridge Trip',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.calendar_today, color: Colors.grey, size: 16),
              SizedBox(width: 5),
              Text(
                'Jan 30, 2020',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              Spacer(),
              // Placeholder for CircleAvatar to be added in Stack
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.access_time, color: Colors.grey, size: 16),
              SizedBox(width: 5),
              Text(
                '13:00 - 15:00',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.person, color: Colors.grey, size: 16),
              SizedBox(width: 5),
              Text(
                'Tuan Tran',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.green),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              'Detail',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
    // Avatar đè lên layout
    Positioned(
      right: 16, // Vị trí ảnh so với cạnh phải
      top: 20,   // Vị trí ảnh so với phía trên
      child: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage('images/3.png'),
      ),
    ),
  ],
)

        ],
      ),
    );
    
  }
  
}
class TripCard1 extends StatelessWidget {
final String title;
  final String date;
  final String time;
  final String person;
  final String location;
  final String imageUrl;
  final String avatarUrl; // Thêm biến avatarUrl

  TripCard1({
    required this.title,
    required this.date,
    required this.time,
    required this.person,
    required this.location,
    required this.imageUrl,
    required this.avatarUrl, // Thêm avatarUrl vào constructor
  });
  
 @override
   Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  'images/6.png',
                  width: double.infinity,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.blue, size: 16),
                      SizedBox(width: 5),
                      Text(
                        'Mark Finished',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  // decoration: BoxDecoration(
                  //   color: Colors.black.withOpacity(0.5),
                  //   borderRadius: BorderRadius.circular(20),
                  // ),
                  child: Row(
                    children: const [
                      Icon(Icons.location_on, color: Colors.white, size: 16),
                      SizedBox(width: 5),
                      Text(
                        'Hanoi, Vietnam',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Positioned(
              //   top: 10,
              //   right: 10,
              //   child: Icon(Icons.more_horiz, color: Colors.white),
              // ),
            ],
          ),
          Stack(
  children: [
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ho Guom Trip',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.calendar_today, color: Colors.grey),
              SizedBox(width: 5),
              Text('Feb 2, 2020', style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.access_time, color: Colors.grey),
              SizedBox(width: 5),
              Text('8:00 - 10:00', style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.person, color: Colors.grey),
              SizedBox(width: 5),
              Text('Emmy', style: TextStyle(color: Colors.grey)),
              Spacer(),
              // Khu vực đè ảnh sẽ được xử lý trong Stack
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.info, color: Colors.teal),
                label: Text('Detail', style: TextStyle(color: Colors.teal)),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.teal),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.chat, color: Colors.teal),
                label: Text('Chat', style: TextStyle(color: Colors.teal)),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.teal),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.payment, color: Colors.teal),
                label: Text('Pay', style: TextStyle(color: Colors.teal)),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.teal),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    // Avatar đè lên layout
    Positioned(
      right: 16, // Điều chỉnh vị trí của avatar
      top: 50,   // Đặt avatar ở góc trên bên phải hoặc theo yêu cầu
      child: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage('images/3.png'),
      ),
    ),
  ],
)

        ],
      ),
    );
  }
}

class TripCard2 extends StatelessWidget {
final String title;
  final String date;
  final String time;
  final String person;
  final String location;
  final String imageUrl;
  final String avatarUrl; // Thêm biến avatarUrl

  TripCard2({
    required this.title,
    required this.date,
    required this.time,
    required this.person,
    required this.location,
    required this.imageUrl,
    required this.avatarUrl, // Thêm avatarUrl vào constructor
  });
  
 @override
   Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  'images/6.png',
                  width: double.infinity,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
             Positioned(
  top: 10,
  right: 10, // Thay đổi từ 'left' thành 'right' để đặt ở góc trên bên phải
  child: Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    // decoration: BoxDecoration(
    //   color: const Color.fromARGB(255, 15, 14, 14).withOpacity(0.75),
    //   borderRadius: BorderRadius.circular(5), // Giảm độ bo tròn để giống hình chữ nhật hơn
    // ),
    child: Icon(
      Icons.more_horiz, // Biểu tượng hình chữ nhật
      color: Colors.white,
      size: 24,
    ),
  ),
),

             Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  // decoration: BoxDecoration(
                  //   color: Colors.black.withOpacity(0.5),
                  //   borderRadius: BorderRadius.circular(20),
                  // ),
                  child: Row(
                    children: const [
                      Icon(Icons.location_on, color: Colors.white, size: 16),
                      SizedBox(width: 5),
                      Text(
                        'Hanoi, Vietnam',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              
            ],
          ),
          Padding(
  padding: const EdgeInsets.all(16.0),
  child: Stack(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ho Guom Trip',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.calendar_today, color: Colors.grey),
              SizedBox(width: 5),
              Text('Feb 2, 2020', style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.access_time, color: Colors.grey),
              SizedBox(width: 5),
              Text('8:00 - 10:00', style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.person, color: Colors.grey),
              SizedBox(width: 5),
              Text('Emmy', style: TextStyle(color: Colors.grey)),
              Spacer(),
              // Khu vực đè ảnh sẽ được xử lý trong Stack
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
      // Avatar đè lên layout
      Positioned(
        right: 0,
        top: 50, // Điều chỉnh vị trí theo yêu cầu
        child: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage('images/3.png'),
        ),
      ),
    ],
  ),
)

        ],
      ),
    );
  }
}
class TripCard3 extends StatelessWidget {
final String title;
  final String date;
  final String time;
  final String person;
  final String location;
  final String imageUrl;
  final String avatarUrl; // Thêm biến avatarUrl

  TripCard3({
    required this.title,
    required this.date,
    required this.time,
    required this.person,
    required this.location,
    required this.imageUrl,
    required this.avatarUrl, // Thêm avatarUrl vào constructor
  });
  final String _price = '\$100.00';
  String get price => _price;
  
  // String get price => null;
  
 @override
   Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  'images/6.png',
                  width: double.infinity,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
             Positioned(
  top: 10,
  right: 10, // Thay đổi từ 'left' thành 'right' để đặt ở góc trên bên phải
  child: Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    // decoration: BoxDecoration(
    //   color: const Color.fromARGB(255, 15, 14, 14).withOpacity(0.75),
    //   borderRadius: BorderRadius.circular(5), // Giảm độ bo tròn để giống hình chữ nhật hơn
    // ),
    child: Icon(
      Icons.bookmark, // Biểu tượng hình chữ nhật
      color: Colors.white,
      size: 24,
    ),
  ),
),

              Positioned(
  bottom: 10,
  left: 10,
  child: Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Row(
      children: const [
        Icon(Icons.star, color: Colors.yellow, size: 16),
        Icon(Icons.star, color: Colors.yellow, size: 16),
        Icon(Icons.star, color: Colors.yellow, size: 16),
        Icon(Icons.star, color: Colors.yellow, size: 16),
        Icon(Icons.star, color: Colors.yellow, size: 16),
        SizedBox(width: 5),
        Text(
          '1247 likes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    ),
  ),
),

              
            ],
          ),
          Padding(
  padding: const EdgeInsets.all(16.0),
  child: Stack(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ho Guom Trip',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.calendar_today, color: Colors.grey),
              SizedBox(width: 5),
              Text('Feb 2, 2020', style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.access_time, color: Colors.grey),
              SizedBox(width: 5),
              Text('8:00 - 10:00', style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 10),
         
      
        ],
      ),
      // Avatar đè lên layout
    Positioned(
  right: 0,
  top: 10, // Điều chỉnh vị trí theo yêu cầu
  child: Column(
    children: [
      Icon(Icons.favorite, color: Colors.green[500], size: 24), // Biểu tượng ở trên
      SizedBox(height: 30), // Khoảng cách giữa Icon và Text
      Text(
        price,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.green[500],
        ),
      ), // Giá tiền ở dưới
    ],
  ),
),

    ],
  ),
)

        ],
      ),
    );
  }
}
