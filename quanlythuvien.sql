create
database QuanLyThuVien;


-- Tao bang category
CREATE TABLE category
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30)
)
INSERT INTO category(name) VALUES ("Textbook"), ("Novel"), ("Reference book"),
    ("Comic"), ("Poem"), ("Dictionary");

-- Tao bang books
create table books
(
    id               INT PRIMARY KEY AUTO_INCREMENT,
    name             VARCHAR(200) NOT NULL,
    author           VARCHAR(20) NOT NULL,
    publishing_house VARCHAR(200) NOT NULL,
    price            FLOAT       NOT NULL,
    year_export      DATE        NOT NULL,
    category_id      INT         NOT NULL,
    number_public    INT         NOT NULL,
    FOREIGN KEY (category_id) REFERENCES category (id)
)
INSERT INTO books(name, author, publishing_house, price, year_export, category_id, number_public)
VALUES
("Sách giáo khoa Toán 12", "ABC", "NXB", 30000, "1999/06/09", 1, 99),
("Tôi thấy hoa vàng trên cỏ xanh", "Nguyễn Nhật Ánh", "Nhà xuất bản Trẻ", 100000, "2010/12/09", 2, 2000),
("Đất rừng phương nam", "Đoàn Giỏi", "Nhà xuất bản Kim Đồng", 73000, "1957/06/09", 2, 1000),
("Trí tuệ giả tạo", "Nicholas Carr", "Nhà xuất bản Trẻ", 99000, "2010/06/09", 3, 9999),
("Thám tử lừng danh Conan", "Aoyama Gosho", "Nhà xuất bản Kim Đồng", 20000, "1994/01/19", 4, 999999),
("Doraemon", "Fujiko Fujio", "Nhà xuất abnr Kim Đồng", 20000, "1969/12/15", 4, 99888),
("Gửi hương cho gió", "Xuân Diệu", "Nhà xuất bản Hội Nhà Văn", 30000, "2008/08/09", 5, 10000);

-- Tao bang students
CREATE TABLE students
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(50) NOT NULL,
    birthdate    DATE        NOT NULL,
    address      VARCHAR(50),
    email        VARCHAR(50) NOT NULL,
    phone_number VARCHAR(11)

)
INSERT INTO students(name, birthdate, address, email, phone_number)
VALUES
("Xuân Anh", "1999/06/09", "Bắc Ninh", "xa@gmail.com", 01234567890),
("Xuân Annn", "1999/01/02", "Hà Nội", "xann@gmail.com", 01234765890),
("Wangyiboo", "1997/08/05", "Bắc Kinh", "wyb@gmail.com", 9784667483),
("Matsumoto Jun", "1983/08/30", "Toshima", "mtmt@gmail.com", 09675567890),
("Komatsu Nana", "1996/02/16", "Tokyo", "nana@gmail.com", 12234567890);

-- Tao bang the muon sach
CREATE TABLE borrow_card
(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    student_id    INT,
    borrow_date   DATE,
    borrow_return DATE,
    FOREIGN KEY (student_id) REFERENCES students (id)
)
INSERT INTO borrow_card(student_id, borrow_date, borrow_return)
VALUES
(2, "2021/04/05", "2021/04/15"),
(1, "2021/04/06", "2021/04/16"),
(5, "2021/05/05", "2021/05/14"),
(4, "2021/06/01", "2021/06/15");

-- Tao bang sach muon
CREATE TABLE books_borrow
(
    book_id INT NOT NULL,
    card_id INT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES books (id),
    FOREIGN KEY (card_id) REFERENCES borrow_card (id)
)
INSERT INTO books_borrow(book_id, card_id)
VALUES
(8,4),
(9,1),
(11,2),
(10,2);