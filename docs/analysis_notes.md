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

Các phân tích tiếp theo cần kiểm tra Revenue theo Customer, Employee, Geographic và Discount để xác định thêm các nguồn đóng góp và khác biệt trong kết quả kinh doanh.

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

## 3. Product Analysis

### Business Questions

- Sản phẩm nào đóng góp nhiều nhất vào Derived Revenue?
- Trong mỗi Category, sản phẩm nào đóng góp Revenue cao nhất?
- Revenue của mỗi Category có tập trung vào một số ít sản phẩm hay được phân bổ tương đối rộng?

### Top Products by Revenue

Top 20 products được xếp hạng theo Derived Revenue.

| Rank | Product | Category | Derived Revenue | Revenue Share |
|---:|---|---|---:|---:|
| 1 | Bread - Calabrese Baguette | Dairy | 18,702,820 | 0.44% |
| 2 | Shrimp - 31/40 | Cereals | 18,522,352 | 0.43% |
| 3 | Puree - Passion Fruit | Beverages | 18,521,966 | 0.43% |
| 4 | Tia Maria | Beverages | 18,497,276 | 0.43% |
| 5 | Zucchini - Yellow | Snails | 18,368,012 | 0.43% |

Top 20 products có Revenue khá sát nhau, với Revenue Share của từng sản phẩm dao động khoảng 0.41%–0.44% tổng Derived Revenue.

Tổng Revenue Share của Top 20 products khoảng 8.43%.

### Finding

`Bread - Calabrese Baguette` có Derived Revenue cao nhất trong Top 20 sản phẩm, đạt khoảng 18.70 triệu, tương đương khoảng 0.44% tổng Derived Revenue.

Các sản phẩm tiếp theo như `Shrimp - 31/40`, `Puree - Passion Fruit` và `Tia Maria` cũng có Revenue gần tương đương, khoảng 18.50 triệu mỗi sản phẩm.

Không có một sản phẩm riêng lẻ nào chiếm tỷ trọng lớn trong tổng Derived Revenue.

### Top 3 Products by Category

Top 3 products trong mỗi Category cho thấy Revenue được phân bổ trên nhiều sản phẩm.

| Category | Top 1 Product | Top 2 Product | Top 3 Product |
|---|---|---|---|
| Beverages | Puree - Passion Fruit | Tia Maria | Placemat - Scallop, White |
| Cereals | Shrimp - 31/40 | Lettuce - Treviso | Ice Cream Bar - Oreo Cone |
| Confections | Hot Chocolate - Individual | Pail With Metal Handle 16l White | Soup - Campbells Tomato Ravioli |
| Dairy | Bread - Calabrese Baguette | Pop Shoppe Cream Soda | Scampi Tail |
| Grain | Grenadine | Bread - Multigrain | Pail For Lid 1537 |
| Meat | Beef - Inside Round | Mushrooms - Black, Dried | Eggplant - Asian |
| Poultry | Vanilla Beans | Beer - Rickards Red | Bread Foccacia Whole |
| Produce | Pasta - Detalini, White, Fresh | Rabbit - Whole | Wine - Cahors Ac 2000, Clos |
| Seafood | Tuna - Salad Premix | Soup Knorr Chili With Beans | Wine - Gato Negro Cabernet |
| Shell fish | Wasabi Powder | Truffle Cups - Brown | Beef - Rib Eye Aaa |
| Snails | Zucchini - Yellow | Pork - Hock And Feet Attached | Chestnuts - Whole,canned |

### Revenue Concentration within Category

| Category | Category Revenue | Top 3 Revenue | Top 3 Revenue Share |
|---|---:|---:|---:|
| Shell fish | 296,681,546 | 51,978,383 | 17.52% |
| Grain | 320,626,814 | 53,515,773 | 16.69% |
| Seafood | 327,198,817 | 53,260,769 | 16.28% |
| Dairy | 350,749,670 | 54,512,354 | 15.54% |
| Beverages | 362,887,661 | 54,915,982 | 15.13% |
| Snails | 368,343,730 | 53,645,174 | 14.56% |
| Cereals | 423,124,754 | 54,623,218 | 12.91% |
| Produce | 364,516,022 | 46,613,267 | 12.79% |
| Poultry | 435,821,699 | 52,847,167 | 12.13% |
| Meat | 487,926,919 | 53,053,503 | 10.87% |
| Confections | 551,364,196 | 52,632,568 | 9.55% |

### Finding

Shell fish có mức độ tập trung Revenue vào Top 3 products cao nhất, với khoảng 17.52% Category Revenue.

Grain và Seafood lần lượt có Top 3 Revenue Share khoảng 16.69% và 16.28%.

Ngược lại, Confections có Category Revenue cao nhất nhưng Top 3 products chỉ đóng góp khoảng 9.55% Category Revenue.

### Business Interpretation

Kết quả cho thấy mức độ tập trung Revenue ở cấp Product khác nhau giữa các Category.

Một số Category như Shell fish có tỷ trọng Revenue tương đối cao đến từ ba sản phẩm đứng đầu. Trong khi đó, Revenue của Confections được phân bổ rộng hơn trên nhiều sản phẩm.

Do đó, Category có tổng Revenue cao không nhất thiết phải phụ thuộc nhiều vào một số ít sản phẩm.

Ở cấp toàn dataset, Top 20 products chỉ đóng góp khoảng 8.43% tổng Derived Revenue. Điều này cho thấy Revenue được phân bổ tương đối rộng giữa các sản phẩm.

### Data Observation

Một số Product–Category mapping có vẻ bất thường về mặt tên sản phẩm và Category, ví dụ:

- `Bread - Calabrese Baguette` → Dairy
- `Shrimp - 31/40` → Cereals
- `Vanilla Beans` → Poultry
- `Beer - Rickards Red` → Poultry

Các trường hợp này được ghi nhận như data observations và chưa được tự ý điều chỉnh.

Phân tích hiện tại chỉ sử dụng CategoryID và ProductID theo mapping có sẵn trong database.

### Caveats

- Revenue là Derived Revenue được tính từ `Price`, `Quantity` và `Discount`.
- `TotalPrice` bằng 0 trên toàn bộ dataset nên không được sử dụng trực tiếp.
- Business definition chính thức của `Discount` chưa được xác nhận.
- Dataset không có Cost/Profit/Margin nên không thể kết luận về profitability của Product hoặc Category.
- Top 20 products chỉ phản ánh nhóm sản phẩm có Revenue cao nhất, không đại diện cho toàn bộ 452 products được bán.
- Các Product–Category mapping bất thường chưa được xác minh với business owner.

---

## 4. Current Analysis Status

### Completed

- Revenue definition validation
- Monthly Revenue analysis
- Gross Sales analysis
- Units Sold analysis
- Transaction Count analysis
- Category Revenue analysis
- Category Revenue Share analysis
- Product Revenue analysis
- Top Product analysis
- Top 3 Product by Category analysis
- Product Revenue concentration analysis

### Next

- Customer analysis
- Employee analysis
- Geographic analysis
- Discount analysis
- Power BI dashboard
