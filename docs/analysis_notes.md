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

Phân tích Product tiếp theo giúp xác định những sản phẩm cụ thể đang tạo ra Revenue trong từng category.

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

Top products được xếp hạng theo Derived Revenue. Bảng dưới đây hiển thị Top 5 products.

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

`Bread - Calabrese Baguette` có Derived Revenue cao nhất trong nhóm Top products, đạt khoảng 18.70 triệu, tương đương khoảng 0.44% tổng Derived Revenue.

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

## 4. Customer Analysis

### Business Questions

- Customer nào đóng góp nhiều nhất vào Derived Revenue?
- Revenue có tập trung vào một số ít customers hay được phân bổ rộng?
- Giá trị trung bình mỗi transaction là bao nhiêu?
- Customer có tần suất giao dịch như thế nào trong observed period?

### Customer Revenue

Top 20 customers được xếp hạng theo Derived Revenue.

| Rank | Customer | Revenue | Units Sold | Transaction Count |
|---:|---|---:|---:|---:|
| 1 | Wayne L Chan | 126,585.89 | 2,424 | 101 |
| 2 | Ronda U Wallace | 121,922.59 | 2,350 | 94 |
| 3 | Olivia K Dean | 121,150.81 | 2,400 | 96 |
| 4 | Paula H Lin | 120,849.78 | 2,400 | 96 |
| 5 | Ericka H O'Connor | 119,730.65 | 2,375 | 95 |
| 6 | Kerri I Bautista | 119,180.30 | 2,225 | 89 |
| 7 | Jami N York | 118,687.74 | 2,300 | 92 |
| 8 | Cherie Z Barrera | 118,133.45 | 2,250 | 90 |
| 9 | Benny D Wilson | 117,902.24 | 2,208 | 92 |
| 10 | Sally U Reid | 117,498.69 | 2,375 | 95 |

### Finding

`Wayne L Chan` có Derived Revenue cao nhất trong nhóm khách hàng được phân tích, đạt khoảng **126.59K**, với 101 transactions và 2,424 units sold.

Các customers tiếp theo trong Top 10 có Revenue khá gần nhau, khoảng 117.50K–121.92K.

Không có sự chênh lệch quá lớn giữa các customers đứng đầu theo Revenue.

### Customer Revenue Concentration

Tổng Derived Revenue của toàn bộ customers có SalesDate hợp lệ là khoảng **4.289 tỷ**.

Top 10 customers tạo ra khoảng **1.202 triệu** Derived Revenue, tương đương khoảng **0.0280%** tổng Derived Revenue.

### Business Interpretation

Revenue được phân bổ rất rộng trên customer base.

Top 10 customers chỉ đóng góp khoảng 0.0280% tổng Derived Revenue trong observed period. Điều này cho thấy tổng Revenue không phụ thuộc đáng kể vào một nhóm rất nhỏ customers.

Do đó, khi phân tích customer contribution, cần xem xét toàn bộ customer base thay vì chỉ tập trung vào Top 10 customers.

### Overall AOV

Overall Average Order Value (AOV):

**AOV = Total Derived Revenue / Transaction Count**

| Metric | Value |
|---|---:|
| Total Derived Revenue | 4,289,241,827.86 |
| Transaction Count | 6,690,599 |
| AOV | **641.08** |

Overall AOV trong observed period là khoảng **641.08 per transaction**.

### Customer AOV

Một số customers có AOV cao hơn đáng kể so với overall AOV.

Customer có AOV cao nhất trong kết quả được phân tích:

| Rank | Customer | Revenue | Transactions | AOV |
|---:|---|---:|---:|---:|
| 1 | Rick O Hinton | 105,064.43 | 66 | 1,591.89 |
| 2 | Janet F Houston | 90,590.82 | 60 | 1,509.85 |
| 3 | Miguel H Bishop | 79,855.32 | 53 | 1,506.70 |
| 4 | Jessie E Holloway | 116,913.96 | 78 | 1,498.90 |
| 5 | Jake D Briggs | 103,384.87 | 70 | 1,476.93 |

Customer có AOV cao nhất không nhất thiết là customer có Revenue cao nhất.

Ví dụ, `Wayne L Chan` đứng đầu về total Revenue nhưng không đứng đầu về AOV.

Điều này cho thấy Revenue và AOV phản ánh các khía cạnh khác nhau của customer value.

### Repeat vs One-time Customers

Trong observed period:

| Customer Type | Customer Count | Rate |
|---|---:|---:|
| One-time Customers | 0 | 0% |
| Repeat Customers | 98,759 | 100% |
| Total Customers | 98,759 | 100% |

Tất cả 98,759 customers đều có nhiều hơn một transaction trong khoảng thời gian quan sát.

Không có customer nào chỉ xuất hiện đúng một transaction.

Tuy nhiên, kết quả này **không nên được diễn giải là 100% customer loyalty hoặc long-term retention**.

Ở đây, `Repeat Customer` chỉ có nghĩa customer có hơn một transaction trong observed period.

### Customer Purchase Frequency

| Metric | Value |
|---|---:|
| Minimum Transactions / Customer | 36 |
| Maximum Transactions / Customer | 102 |
| Average Transactions / Customer | 67.75 |

Phân phối customer theo transaction frequency:

| Transaction Frequency Group | Customer Count | Customer Share |
|---|---:|---:|
| 1–10 | 0 | 0% |
| 11–30 | 0 | 0% |
| 31–50 | 1,463 | 1.481% |
| 51–100 | 97,290 | 98.513% |
| >100 | 6 | 0.006% |

### Finding

Phần lớn customer có tần suất giao dịch nằm trong khoảng 51–100 transactions.

Cụ thể, **97,290 customers**, tương đương khoảng **98.51% customer base**, nằm trong nhóm 51–100 transactions.

Customer có ít transactions nhất vẫn có 36 transactions, trong khi customer có nhiều transactions nhất có 102 transactions.

### Business Interpretation

Customer transaction frequency trong dataset tập trung rất mạnh trong observed period.

Tuy nhiên, transaction frequency cao không đồng nghĩa với long-term retention hoặc customer loyalty.

Dataset chỉ phản ánh hành vi giao dịch trong khoảng thời gian quan sát từ **01/01/2018 đến 09/05/2018**. Vì vậy, kết quả nên được hiểu là:

> Customer purchase frequency during the observed period.

Không nên sử dụng kết quả này để kết luận về lifetime value hoặc retention dài hạn.

### Caveats

- Revenue là Derived Revenue được tính từ `Price`, `Quantity` và `Discount`.
- `TotalPrice` bằng 0 toàn bộ dataset.
- Customer analysis chỉ sử dụng các sales records có `SalesDate IS NOT NULL`.
- Top 10 customer concentration chỉ phản ánh observed period.
- Repeat customer được định nghĩa là customer có hơn một transaction trong observed period.
- Không thể kết luận long-term retention hoặc loyalty từ dataset này.
- Dataset có khoảng 4 tháng và 9 ngày dữ liệu, nên purchase frequency cần được hiểu trong phạm vi thời gian này.
- Không nên kết luận customer nào "tốt nhất" chỉ dựa trên một metric; Revenue, AOV, Units Sold và Transaction Count phản ánh các khía cạnh khác nhau.

---

## 5. Employee Analysis

### 5.1 Employee Revenue

Employee Revenue được tính theo:

> Revenue = Price × Quantity × (1 - Discount)

Kết quả cho thấy có 23 nhân viên tham gia tạo doanh thu trong kỳ quan sát.

Top employees theo Derived Revenue:

| Rank | Employee | Revenue | Units Sold | Transactions |
|---:|---|---:|---:|---:|
| 1 | Devon D Brewer | 188.17M | 3,803,313 | 292,024 |
| 2 | Shelby P Riddle | 187.58M | 3,781,726 | 290,669 |
| 3 | Katina Y Marks | 187.44M | 3,785,142 | 290,633 |
| 4 | Desiree L Stuart | 187.27M | 3,781,780 | 290,729 |
| 5 | Darnell O Nielsen | 187.21M | 3,792,135 | 291,767 |

Devon D Brewer có Derived Revenue cao nhất, khoảng 188.17M.

Revenue giữa các nhân viên khá sát nhau. Nhân viên có Revenue cao nhất đạt khoảng 188.17M, trong khi nhân viên thấp nhất trong toàn bộ nhóm đạt khoảng 184.35M.

### 5.2 Employee Revenue Concentration

Top 5 employees:

- Top 5 Revenue: 937.67M
- Total Revenue: 4.289B
- Top 5 Revenue Share: 21.86%

Top 5 employees đóng góp khoảng 21.86% tổng Derived Revenue.

Điều này cho thấy Revenue được phân bổ tương đối đều giữa 23 employees trong kỳ quan sát, thay vì tập trung vào một số ít employees.

### 5.3 Employee AOV

AOV được tính:

> AOV = Revenue / Transaction Count

Một số employees có AOV cao trong kết quả:

| Rank | Employee | AOV |
|---:|---|---:|
| 1 | Shelby P Riddle | 645.35 |
| 2 | Katina Y Marks | 644.93 |
| 3 | Devon D Brewer | 644.35 |
| 4 | Desiree L Stuart | 644.15 |
| 5 | Tonia O Mc Millan | 643.99 |

AOV giữa các employees không chênh lệch lớn.

Shelby P Riddle có AOV cao nhất trong kết quả, khoảng 645.35.

### 5.4 Employee Revenue Share

Revenue Share của employees cũng khá đồng đều.

- Devon D Brewer: 4.387%
- Shelby P Riddle: 4.373%
- Katina Y Marks: 4.370%
- Desiree L Stuart: 4.366%
- Seth D Franco: 4.298%

### 5.5 Employee Insight

> Employee Revenue được phân bổ khá đồng đều giữa 23 employees. Devon D Brewer có Derived Revenue cao nhất, khoảng 188.17M, tương đương 4.39% tổng Revenue. Top 5 employees đóng góp 21.86% tổng Derived Revenue. AOV giữa các employees cũng khá sát nhau. Kết quả này mô tả phân bổ doanh thu trong kỳ quan sát và chưa đủ để đánh giá hiệu suất hay năng suất nhân viên vì dataset không có employee target, quota hoặc cost.

---

## 6. Geographic Analysis

### 6.1 Country Revenue

Dataset chỉ ghi nhận một quốc gia:

| Country | Revenue | Units Sold | Transactions |
|---|---:|---:|---:|
| United States | 4.289B | 87,003,547 | 6,690,599 |

United States chiếm 100% Derived Revenue trong dataset.

Do chỉ có một country được ghi nhận, country-level comparison không cung cấp nhiều thông tin phân biệt.

### 6.2 City Revenue

Top cities theo Derived Revenue:

| Rank | City | Revenue | Units Sold | Transactions |
|---:|---|---:|---:|---:|
| 1 | Tucson | 48.35M | 983,617 | 74,904 |
| 2 | Jackson | 47.92M | 966,980 | 71,777 |
| 3 | Sacramento | 47.69M | 972,892 | 73,837 |
| 4 | Fort Wayne | 47.24M | 958,555 | 74,400 |
| 5 | Indianapolis | 46.92M | 951,444 | 73,797 |

Tucson có Derived Revenue cao nhất trong kết quả, khoảng 48.35M.

Revenue giữa các cities trong nhóm dẫn đầu khá sát nhau.

### 6.3 City Revenue Concentration

- Top 10 City Revenue: 470.93M
- Total Revenue: 4.289B
- Top 10 City Revenue Share: 10.98%

Top 10 cities đóng góp 10.98% tổng Derived Revenue.

Điều này cho thấy phần lớn Revenue nằm ngoài nhóm 10 cities đứng đầu trong observed period.

### 6.4 Geographic Data Quality Observation

Trong kết quả city analysis, `Colorado` xuất hiện trong trường `CityName`.

Đây là một potential master-data issue vì `Colorado` thường được biết đến là tên bang của Hoa Kỳ thay vì tên city.

Dataset chưa được tự ý sửa. Đây chỉ được ghi nhận như một data quality observation cần kiểm tra thêm với business/source system trước khi sử dụng cho reporting chính thức.

### 6.5 Geographic Insight

> Dataset chỉ ghi nhận United States ở cấp country. Ở cấp city, Tucson có Derived Revenue cao nhất khoảng 48.35M. Top 10 cities đóng góp 10.98% tổng Revenue, cho thấy phần lớn Revenue nằm ngoài nhóm 10 cities đứng đầu trong observed period. Ngoài ra, phát hiện `Colorado` trong CityName là một potential master-data issue cần xác minh trước khi sử dụng city-level reporting chính thức.

---

## 7. Discount Analysis

### 7.1 Revenue by Discount Level

Dataset quan sát được ba mức Discount chính:

- 0%
- 10%
- 20%

| Discount | Transactions | Units Sold | Gross Sales | Revenue | Discount Amount |
|---:|---:|---:|---:|---:|---:|
| 0% | 5,353,035 | 69,599,247 | 3.538B | 3.538B | 0 |
| 10% | 670,318 | 8,729,851 | 443.31M | 398.98M | 44.33M |
| 20% | 667,246 | 8,674,449 | 440.68M | 352.55M | 88.14M |

`DiscountAmount` là derived metric:

> Discount Amount = Price × Quantity × Discount

Đây không phải field có sẵn trong source dataset.

### 7.2 Transaction Share and Revenue Share

| Discount | Transaction Share | Revenue Share |
|---:|---:|---:|
| 0% | 80.01% | 82.48% |
| 10% | 10.02% | 9.30% |
| 20% | 9.97% | 8.22% |

Các nhóm có Discount chiếm tỷ trọng Revenue thấp hơn tỷ trọng Transaction của chúng.

Ví dụ:

- 10% Discount: 10.02% transactions nhưng 9.30% Revenue.
- 20% Discount: 9.97% transactions nhưng 8.22% Revenue.

### 7.3 AOV by Discount Level

| Discount | Transactions | Revenue | AOV |
|---:|---:|---:|---:|
| 0% | 5,353,035 | 3.538B | 660.88 |
| 10% | 670,318 | 398.98M | 595.21 |
| 20% | 667,246 | 352.55M | 528.36 |

Observed AOV giảm theo mức Discount:

- 0%: 660.88
- 10%: 595.21
- 20%: 528.36

### 7.4 Discount Insight

> Trong dữ liệu quan sát, AOV giảm khi mức Discount tăng: 660.88 ở nhóm 0%, 595.21 ở nhóm 10% và 528.36 ở nhóm 20%. Đồng thời, các nhóm có Discount chiếm tỷ trọng Revenue thấp hơn tỷ trọng Transaction của chúng.

Tuy nhiên, đây là **descriptive association**, không phải bằng chứng về causation.

Không nên kết luận:

> "Discount làm giảm Revenue."

Lý do là các nhóm Discount có thể khác nhau về product mix, quantity, customer mix, thời điểm hoặc các yếu tố khác.

### 7.5 Discount Data Limitation

Ý nghĩa chính thức của field `Discount` chưa được xác nhận từ source documentation.

Phân tích hiện tại dựa trên các giá trị quan sát được:

- 0%
- 10%
- 20%

Do đó, Discount Analysis được xem là phân tích mô tả theo observed discount level.

---

## 8. Current Analysis Status

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
- Customer Revenue analysis
- Customer Revenue Share analysis
- Top 10 Customer Revenue Concentration analysis
- Overall AOV analysis
- Customer AOV analysis
- Repeat vs One-time Customer analysis
- Customer Purchase Frequency analysis
- Employee Revenue analysis
- Employee Revenue Concentration analysis
- Employee AOV analysis
- Employee Revenue Share analysis
- Country Revenue analysis
- City Revenue analysis
- Top 10 City Revenue Concentration analysis
- Discount Revenue analysis
- Discount Transaction Share analysis
- Discount Revenue Share analysis
- Discount AOV analysis

### Next

- Build Power BI data model
- Create Power BI KPI cards
- Create Revenue Trend dashboard
- Create Category/Product visuals
- Create Customer/Employee/Geographic visuals
- Create Discount analysis visual
- Write final business insights
- Write business recommendations
- Prepare README for GitHub
