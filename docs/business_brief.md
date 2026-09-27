# Project 1 – Grocery / FMCG Analytics
## Business Brief

## 1. Business Context

Doanh nghiệp muốn tăng doanh thu nhưng chưa xác định rõ doanh thu đang đến chủ yếu từ nhóm khách hàng nào, sản phẩm nào, danh mục nào, khu vực nào và mức discount có liên quan như thế nào đến kết quả bán hàng.

Dataset Grocery Sales được sử dụng để phân tích hoạt động bán hàng theo thời gian, sản phẩm, khách hàng, nhân viên và thị trường.

Dataset gồm 7 bảng:

- sales
- products
- customers
- employees
- categories
- cities
- countries

Bảng `sales` có 6,758,125 bản ghi.

---

## 2. Business Objective

Phân tích doanh thu, sản phẩm, khách hàng, nhân viên và thị trường theo thời gian để xác định các nhóm đóng góp chính vào kết quả kinh doanh và hỗ trợ doanh nghiệp ưu tiên các hoạt động bán hàng.

---

## 3. Business Questions

### Revenue
1. Revenue thay đổi như thế nào theo thời gian?
2. Tháng nào có Revenue cao hoặc thấp hơn?

### Product
3. Danh mục sản phẩm nào đóng góp nhiều nhất vào Revenue?
4. Sản phẩm nào đóng góp nhiều nhất?
5. Sản phẩm nào có số lượng bán cao nhưng Revenue thấp hoặc ngược lại?

### Customer
6. Những khách hàng nào đóng góp nhiều nhất vào Revenue?
7. Doanh thu tập trung vào một nhóm nhỏ khách hàng hay phân bổ tương đối rộng?

### Employee
8. Nhân viên nào tạo ra nhiều giao dịch và Revenue nhất?

### Geography
9. Revenue phân bổ như thế nào theo thành phố và quốc gia?

### Discount
10. Các mức Discount khác nhau có liên quan như thế nào đến Revenue và Gross Sales?

---

## 4. Scope

### In Scope

- Revenue analysis
- Gross Sales analysis
- Units Sold
- Transaction Count
- Product analysis
- Category analysis
- Customer analysis
- Employee analysis
- Geographic analysis
- Discount analysis
- Time-based analysis

### Out of Scope

- Profit / Profit Margin
- Cost analysis
- Inventory performance
- Stock-out analysis
- Customer lifetime value
- Long-term retention analysis

Các nội dung trên không được phân tích vì dataset hiện tại không cung cấp đầy đủ các trường dữ liệu cần thiết.

---

## 5. Revenue Definition

`TotalPrice` trong dataset bằng 0 trên toàn bộ 6,758,125 bản ghi nên không được sử dụng trực tiếp làm Revenue.

Revenue được xây dựng dưới dạng derived metric:

Revenue = Price × Quantity × (1 - Discount)

Gross Sales được tính:

Gross Sales = Price × Quantity

Công thức Revenue đã được kiểm tra trên một số bản ghi mẫu.

Tuy nhiên, business definition chính thức của trường `Discount` chưa được xác nhận từ nguồn nghiệp vụ. Các giá trị quan sát được trong dataset tương ứng với 0%, 10% và 20%.

Do đó, Revenue trong project được gọi là `Derived Revenue`.

---

## 6. Dataset Limitations

- `TotalPrice` bằng 0 trên toàn bộ dataset.
- `SalesDate` có 67,526 giá trị NULL, tương đương khoảng 1.00% số bản ghi sales.
- Dữ liệu có khoảng thời gian từ 2018-01-01 đến 2018-05-09 đối với các bản ghi có SalesDate.
- Dữ liệu tháng 5 chỉ bao phủ đến ngày 09/05 nên không nên so sánh trực tiếp với một tháng đầy đủ.
- Dataset không có Cost, Profit hoặc Margin nên không thể kết luận về lợi nhuận.
- Business meaning chính thức của `Discount` chưa được xác nhận.
- Một số thuộc tính sản phẩm như `Class`, `Resistant` và `VitalityDays` chưa có business definition chính thức trong dataset description.
