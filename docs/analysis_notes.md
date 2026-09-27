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
