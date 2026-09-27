# Project 1 – Analysis Notes

## 1. Revenue Trend

### Business Question

Doanh thu thay đổi như thế nào theo thời gian?

### Revenue Definition

Derived Revenue:

Revenue = Price × Quantity × (1 - Discount)

Gross Sales:

Gross Sales = Price × Quantity

### Monthly Result

| Month | Derived Revenue | Gross Sales | Units Sold | Transaction Count |
|---|---:|---:|---:|---:|
| January 2018 | 1,030,735,897 | 1,062,477,844 | 20,900,454 | 1,607,050 |
| February 2018 | 929,204,218 | 957,879,527 | 18,862,843 | 1,451,366 |
| March 2018 | 1,032,200,776 | 1,064,094,323 | 20,930,945 | 1,609,190 |
| April 2018 | 997,268,501 | 1,028,150,926 | 20,229,466 | 1,556,091 |
| May 2018* | 299,832,436 | 309,107,282 | 6,079,839 | 466,902 |

*May 2018 only contains data through 09/05/2018.

### Finding

Revenue giảm từ khoảng 1.031 tỷ vào tháng 1 xuống khoảng 929 triệu vào tháng 2.

Revenue tăng trở lại vào tháng 3, đạt khoảng 1.032 tỷ.

Đến tháng 4, Revenue giảm nhẹ xuống khoảng 997 triệu.

Tháng 5 ghi nhận khoảng 300 triệu Revenue, tuy nhiên dữ liệu chỉ bao phủ đến ngày 09/05 nên chưa thể sử dụng để đánh giá hiệu quả của toàn bộ tháng 5.

Units Sold và Transaction Count có xu hướng biến động tương tự Revenue trong các tháng 1 đến 4.

### Business Interpretation

Kết quả cho thấy Revenue có sự biến động theo thời gian. Tháng 2 là giai đoạn Revenue thấp hơn tháng 1 và tháng 3, trong khi tháng 3 ghi nhận mức Revenue cao nhất trong các tháng đầy đủ dữ liệu từ tháng 1 đến tháng 4.

Tuy nhiên, kết quả này mới mô tả sự thay đổi của Revenue theo thời gian và chưa xác định nguyên nhân.

Các phân tích tiếp theo cần kiểm tra Revenue theo Category, Product, Customer và Discount để xác định nguồn đóng góp chính.

### Caveats

- `TotalPrice` bằng 0 toàn bộ dataset nên không được sử dụng trực tiếp.
- Revenue là Derived Revenue được tính từ Price, Quantity và Discount.
- Business definition chính thức của Discount chưa được xác nhận.
- Tháng 5 không phải một tháng đầy đủ.

---

## 2. Category Analysis

### Business Question

Category nào đóng góp nhiều nhất vào Revenue?

### Result

| Category | Derived Revenue | Gross Sales | Units Sold | Transaction Count |
|---|---:|---:|---:|---:|
| Confections | 551,364,196 | 568,364,034 | 10,967,277 | 843,466 |
| Meat | 487,926,919 | 503,003,216 | 9,621,629 | 740,223 |
| Poultry | 435,821,699 | 449,272,583 | 9,071,479 | 697,205 |
| Cereals | 423,124,754 | 436,248,003 | 8,647,338 | 665,059 |
| Snails | 368,343,730 | 379,741,148 | 7,128,070 | 548,123 |
| Produce | 364,516,022 | 375,834,893 | 8,283,590 | 636,392 |
| Beverages | 362,887,661 | 374,131,156 | 7,320,055 | 563,517 |
| Dairy | 350,749,670 | 361,504,731 | 6,745,711 | 518,600 |
| Seafood | 327,198,817 | 337,288,065 | 6,925,812 | 532,207 |
| Grain | 320,626,814 | 330,514,225 | 5,378,584 | 413,658 |
| Shell fish | 296,681,546 | 305,807,848 | 6,914,002 | 532,149 |

### Finding

Confections có Derived Revenue cao nhất, đạt khoảng 551.36 triệu.

Meat đứng thứ hai với khoảng 487.93 triệu, tiếp theo là Poultry và Cereals.

Shell fish có Derived Revenue thấp nhất trong các category được phân tích, khoảng 296.68 triệu.

### Revenue Contribution

Confections có Revenue Share cao nhất, chiếm khoảng 12.85% tổng Derived Revenue.

Meat chiếm khoảng 11.38%, Poultry khoảng 10.16% và Cereals khoảng 9.86%.

Bốn category đứng đầu gồm Confections, Meat, Poultry và Cereals, đóng góp tổng cộng khoảng 44.26% tổng Derived Revenue.

Không có một category đơn lẻ nào chiếm phần lớn tổng Revenue. Revenue được phân bổ tương đối rộng giữa các category.

### Business Interpretation

Kết quả cho thấy Revenue được phân bổ trên nhiều category thay vì tập trung vào một category duy nhất.

Confections là category có đóng góp Revenue cao nhất nhưng chỉ chiếm khoảng 12.85% tổng Derived Revenue.

Điều này cho thấy khi phân tích Revenue, cần xem xét đồng thời nhiều category thay vì chỉ tập trung vào category đứng đầu.

Phân tích Product tiếp theo sẽ giúp xác định những sản phẩm cụ thể đang tạo ra Revenue trong từng category.

### Caveats

- Revenue là Derived Revenue, không phải giá trị lấy trực tiếp từ `TotalPrice`.
- `TotalPrice` bằng 0 toàn bộ dataset.
- Business definition chính thức của `Discount` chưa được xác nhận.
- Dataset không có Cost/Profit/Margin nên không thể kết luận về profitability của category.

---

## 3. Current Analysis Status

### Completed

- Revenue definition validation
- Monthly Revenue analysis
- Gross Sales analysis
- Units Sold analysis
- Transaction Count analysis
- Category Revenue analysis
- Category Revenue Share analysis

### Next

- Product analysis
- Customer analysis
- Employee analysis
- Geographic analysis
- Discount analysis
- Power BI dashboard
